
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

Análise e escolha dos paradigmas de programação (imperativo, funcional, lógico, etc.) mais adequados para o desenvolvimento da aplicação.

## Elaboração de um plano detalhado de Gerenciamento de Configuração.

Elaboração de um plano detalhado de Gerenciamento de Configuração, incluindo políticas de versionamento, controle de mudanças e identificação de itens de configuração.
