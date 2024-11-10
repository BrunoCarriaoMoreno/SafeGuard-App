
# Segunda parte da AEP do 6 semestre

Neste repositório se encontra o codigo do aplicativo desenvolvido, junto dos outros pontos solicitados para a entrega do trabalho.


## Implementação de algoritmos de aprendizado de máquina.

Para detectar anomalias de rede, implementamos um algoritmo de aprendizado de máquina baseado no modelo Isolation Forest, uma técnica eficaz para identificar comportamentos fora do padrão. Esta abordagem se adapta bem ao nosso aplicativo, permitindo que identifiquemos automaticamente atividades incomuns no tráfego de rede após capturarmos uma amostra do tráfego usual do usuário para definir um padrão de normalidade.

### Etapas da Implementação

#### 1. Coleta do Tráfego Normal

O processo começa pela coleta de dados de tráfego "normal", que serve como base de referência. Esses dados são salvos em um arquivo CSV e contêm informações detalhadas, como endereços IP de origem e destino, protocolos, portas, tamanho dos pacotes e do payload, duração do pacote e flags TCP. Esse conjunto de dados é usado para definir o padrão normal de tráfego do usuário.

[imagem]

#### 2. Treinamento do Modelo com Isolation Forest

Utilizamos os dados de tráfego normal para treinar um modelo com Isolation Forest, uma técnica não supervisionada que "aprende" a caracterizar o tráfego típico do usuário. Essa técnica é projetada para detectar anomalias isolando observações que se desviam do padrão estabelecido. O modelo identifica padrões recorrentes, diferenciando comportamentos normais dos anômalos de forma automatizada.

[imagem]

#### 3. Monitoramento em Tempo Real e Detecção de Anomalias

Após o treinamento, passamos a monitorar o tráfego em tempo real. A cada pacote capturado, o modelo classifica o comportamento como:

- -1: anômalo (ou seja, fora do padrão de normalidade),
- 1: normal.

[imagem]

Essa classificação permite que o sistema identifique e registre atividades incomuns que podem representar riscos à segurança, como tentativas de invasão ou ataques.

#### Conclusão
Essa implementação é particularmente útil para detectar atividades incomuns na rede, como ataques, invasões ou comportamentos maliciosos, tornando o sistema mais seguro e autônomo na identificação de ameaças. Em cenários onde o tráfego de rede é complexo e difícil de rotular manualmente, essa abordagem baseada em anomalias fornece um método confiável para identificar potenciais problemas com base no padrão de comportamento usual do tráfego.

## Documentação detalhada das manutenções realizadas no software.

Documentação detalhada das manutenções realizadas no software, abrangendo as categorias corretiva, adaptativa, perfectiva e preditiva.


## Testes abrangentes.

Testes abrangentes para garantir a qualidade e confiabilidade do aplicativo.

## Análise e escolha dos paradigmas de programação.
Para o desenvolvimento desta aplicação, foram adotados os paradigmas imperativo, funcional e orientado a objetos. Cada paradigma desempenha uma função específica e essencial, aproveitando os pontos fortes de cada abordagem para atender às necessidades de detecção de anomalias e interação com o usuário na aplicação.

### Paradigma Imperativo/funcional

O código em Python utiliza uma combinação dos paradigmas imperativo e funcional, o que orienta o fluxo de operações e organiza o processamento dos dados de tráfego de rede. O paradigma imperativo define uma sequência clara e ordenada de instruções para capturar, processar e monitorar o tráfego, facilitando a construção de um pipeline linear e eficiente, desde a captura dos pacotes até a detecção de anomalias.

Em algumas partes do código, especialmente nas funções de processamento de pacotes (process_packet) e de monitoramento (monitor_traffic), o estilo funcional foi adotado para melhorar a modularidade e a reutilização. Essa abordagem funcional facilita a legibilidade e a organização do código, pois permite que pequenas funções tratem dados de forma isolada, sem depender de variáveis de estado, o que é particularmente útil em operações de filtragem e manipulação de dados de rede.

Essa combinação imperativo/funcional em Python é essencial para criar algoritmos robustos que capturam pacotes em tempo real e realizam análise de anomalias, além de permitir uma integração ágil com bibliotecas de aprendizado de máquina e manipulação de redes.

### Paradigma Orientado a Objetos

No desenvolvimento da aplicação móvel em Flutter, o paradigma orientado a objetos foi escolhido para estruturar a interface e gerenciar os dados da aplicação. Esse paradigma se mostra adequado para aplicações interativas, pois permite organizar o código de forma modular e reutilizável, além de encapsular o estado de forma eficiente.

A programação orientada a objetos oferece a vantagem de organizar o código em torno de "objetos," que representam elementos do mundo real com propriedades e comportamentos próprios. Essa abordagem facilita a modularidade e a reutilização, permitindo que o código seja dividido em componentes independentes e reutilizáveis. Além disso, o encapsulamento permite que cada objeto gerencie seu próprio estado, reduzindo a complexidade e tornando o código mais seguro e fácil de manter. Com a orientação a objetos, projetos grandes e complexos se tornam mais estruturados e flexíveis, facilitando a expansão e manutenção da aplicação ao longo do tempo.

#### Conclusão
Essa escolha de paradigmas permite que a aplicação mantenha uma estrutura robusta e modular, maximizando a clareza, eficiência e experiência de usuário. A combinação do imperativo e funcional em Python fornece um fluxo claro e eficiente para análise de dados, enquanto o paradigma orientado a objetos em Flutter oferece uma interface de usuário altamente responsiva e escalável. Juntos, esses paradigmas tornam a aplicação eficiente tanto na análise de dados quanto na interação com o usuário.

## Elaboração de um plano detalhado de Gerenciamento de Configuração.

Elaboração de um plano detalhado de Gerenciamento de Configuração, incluindo políticas de versionamento, controle de mudanças e identificação de itens de configuração.
