import pandas as pd
from sklearn.ensemble import IsolationForest
from scapy.all import sniff, IP, TCP, UDP
from datetime import datetime
import csv

NORMAL_TRAFFIC_FILE = 'trafego_normal.csv'

def capture_normal_traffic(duration=10):
    print(f"Capturando tráfego normal por {duration} segundos...")
    packets = sniff(timeout=duration)
    traffic_data = []

    for packet in packets:
        if IP in packet:
            timestamp = datetime.timestamp(datetime.now())
            src_ip = packet[IP].src
            dst_ip = packet[IP].dst
            protocol = packet[IP].proto
            src_port = packet.sport if hasattr(packet, 'sport') else 0
            dst_port = packet.dport if hasattr(packet, 'dport') else 0
            packet_size = len(packet)
            payload_size = len(packet[IP].payload) if packet[IP].payload else 0
            packet_duration = packet.time - timestamp
            tcp_flags = packet[TCP].flags if TCP in packet else None

            traffic_data.append([
                timestamp, src_ip, dst_ip, protocol, src_port, dst_port, packet_size, 
                payload_size, packet_duration, tcp_flags
            ])

    with open(NORMAL_TRAFFIC_FILE, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow([
            'Timestamp', 'Source IP', 'Destination IP', 'Protocol', 
            'Source Port', 'Destination Port', 'Packet Size (Bytes)', 
            'Payload Size (Bytes)', 'Packet Duration', 'TCP Flags'
        ])
        writer.writerows(traffic_data)
    print(f"Tráfego normal capturado e salvo em {NORMAL_TRAFFIC_FILE}")

def load_and_prepare_data(file_path):
    data = pd.read_csv(file_path)

    # Conversão dos tipos de dados
    data['Timestamp'] = data['Timestamp'].astype(float)
    data['Source Port'] = data['Source Port'].astype(int)
    data['Destination Port'] = data['Destination Port'].astype(int)
    data['Packet Size (Bytes)'] = data['Packet Size (Bytes)'].astype(int)
    data['Payload Size (Bytes)'] = data['Payload Size (Bytes)'].astype(int)
    data['Packet Duration'] = data['Packet Duration'].astype(float)
    data['Protocol'] = data['Protocol'].astype(int)

    features = data[['Timestamp', 'Source Port', 'Destination Port', 'Packet Size (Bytes)', 
                     'Payload Size (Bytes)', 'Packet Duration', 'Protocol']]
    return features

def train_model():
    normal_traffic = load_and_prepare_data(NORMAL_TRAFFIC_FILE)
    model = IsolationForest(contamination=0.01, random_state=42)
    model.fit(normal_traffic)
    print("Modelo treinado com o tráfego normal.")
    return model

def monitor_traffic(model, duration=10):
    print(f"Monitorando o tráfego em tempo real por {duration} segundos...")
    live_traffic = []

    def process_packet(packet):
        if IP in packet:
            timestamp = datetime.timestamp(datetime.now())
            src_ip = packet[IP].src
            dst_ip = packet[IP].dst
            protocol = packet[IP].proto
            src_port = packet.sport if hasattr(packet, 'sport') else 0
            dst_port = packet.dport if hasattr(packet, 'dport') else 0
            packet_size = len(packet)
            payload_size = len(packet[IP].payload) if packet[IP].payload else 0
            packet_duration = packet.time - timestamp
            tcp_flags = packet[TCP].flags if TCP in packet else None
            
            live_traffic.append([
                timestamp, src_ip, dst_ip, protocol, src_port, dst_port, packet_size, 
                payload_size, packet_duration, tcp_flags
            ])

    sniff(timeout=duration, prn=process_packet)
    live_traffic_df = pd.DataFrame(live_traffic, columns=[
        'Timestamp', 'Source IP', 'Destination IP', 'Protocol', 
        'Source Port', 'Destination Port', 'Packet Size (Bytes)', 
        'Payload Size (Bytes)', 'Packet Duration', 'TCP Flags'
    ])
    
    live_traffic_df['Anomaly'] = model.predict(live_traffic_df[['Timestamp', 'Source Port', 'Destination Port', 
                                                                'Packet Size (Bytes)', 'Payload Size (Bytes)', 
                                                                'Packet Duration', 'Protocol']])
    anomalies = live_traffic_df[live_traffic_df['Anomaly'] == -1]

    print("\nResultados da detecção de anomalias:")
    if not anomalies.empty:
        for _, row in anomalies.iterrows():
            print(f"\nAnomalia detectada:")
            print(f"  Timestamp: {row['Timestamp']}")
            print(f"  Source IP: {row['Source IP']}")
            print(f"  Destination IP: {row['Destination IP']}")
            print(f"  Protocol: {row['Protocol']}")
            print(f"  Source Port: {row['Source Port']}")
            print(f"  Destination Port: {row['Destination Port']}")
            print(f"  Packet Size (Bytes): {row['Packet Size (Bytes)']}")
            print(f"  Payload Size (Bytes): {row['Payload Size (Bytes)']}")
            print(f"  Packet Duration: {row['Packet Duration']}")
            print(f"  TCP Flags: {row['TCP Flags']}")
    else:
        print("Nenhuma anomalia detectada.")

def display_menu():
    print("\n=== Menu de Captura e Monitoramento de Tráfego ===")
    print("1. Gravar tráfego normal")
    print("2. Monitorar tráfego com base no modelo de tráfego normal")
    print("3. Sair")
    choice = input("Escolha uma opção: ")
    return choice

def main():
    while True:
        choice = display_menu()
        if choice == '1':
            duration = int(input("Informe a duração para capturar o tráfego normal (em segundos): "))
            capture_normal_traffic(duration)
        elif choice == '2':
            try:
                model = train_model()
                duration = int(input("Informe a duração para monitorar o tráfego (em segundos): "))
                monitor_traffic(model, duration)
            except FileNotFoundError:
                print("Erro: Não há tráfego normal gravado. Por favor, grave primeiro.")
        elif choice == '3':
            print("Encerrando o programa.")
            break
        else:
            print("Opção inválida. Tente novamente.")

if __name__ == "__main__":
    main()
