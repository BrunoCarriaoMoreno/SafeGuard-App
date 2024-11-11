
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

A principal categoria de manutenções realizadas no sistema é a manutenção perfectiva, devido ao estágio inicial de desenvolvimento em que ele se encontra. Nesse momento, ainda não existem usuários ativos, e o foco está em ajustar, aprimorar e expandir as funcionalidades para garantir que o sistema atenda aos requisitos estabelecidos de forma eficiente e robusta. Como o sistema ainda não foi amplamente utilizado, não surgiram necessidades de correção de falhas operacionais, o que prioriza aprimoramentos que visam tornar a aplicação mais eficaz e bem documentada, em vez de ajustes corretivos ou adaptativos. Assim, é possível evidenciar a principal categoria de acordo com a coleção de atividades planejadas para o sistema inserida logo abaixo.

- [NAVEGAÇÃO] Desenvolver modelo base da navegação do aplicativo
- [TECH] Configurar workflow para teste/build e release
- [ANÁLISE DE REDE] Desenvolver leitura de pacotes de rede
- [TECH] Definir qual abordagem de aprendizado de máquina será utilizado
- [TECH] Desenvolver validação do arquivo do banco de dados
- [TELA PRINCIPAL] Desenvolver componente de ativação de monitoramento
- [TELA PRINCIPAL] Desenvolver o componente de  listagem de anomalias
- [ANÁLISE DE REDE] Desenvolver sistema de análise dos pacotes de rede
- [TECH] Utilizar o tensor flow para treinar o machine learning
- [TELA DE CONFIGURAÇÕES] Desenvolver tela de configurações do sistema
- [NOTIFICAÇÃO] Desenvolver alertas de segurança modelo push
- [DOCUMENTAÇÃO] Criar manual do usuário
- [CONFIGURAÇÕES] Desenvolver opção de habilitar monitoramento de downloads
- [CONFIGURAÇÕES] Desenvolver opção de habilitar monitoramento de navegação web
- [CONFIGURAÇÕES] Desenvolver opção para ativar ou desativar notificações
- [CONFIGURAÇÕES] Desenvolver botão de navegação para a tela de manual do usuário
- [DOCUMENTAÇÃO] Criar termos de uso do aplicativo
- [DOCUMENTAÇÃO] Criar políticas de privacidade do aplicativo
- [TELA MANUAL DO USUÁRIO] Desenvolver componente de visualização do manual do usuário

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

Para garantir a consistência, rastreabilidade e controle de mudanças ao longo do ciclo de vida do desenvolvimento, foi elaborado um plano de Gerenciamento de Configuração que define as diretrizes de versionamento, controle de mudanças e identificação dos itens de configuração. Esse plano adota práticas estabelecidas para uma organização eficiente do código e facilita a colaboração entre equipes.

### Políticas de Versionamento e Controle de Branches

Utilizamos a estratégia Git Flow para o gerenciamento das branches com algumas personalizações devido o escopo do projeto, o que permite uma separação clara entre o desenvolvimento de novas funcionalidades e o trabalho em produção.

***Branch Principal (main):*** Esta branch representa a versão estável do produto, adequada para produção.

***Branch de Desenvolvimento (develop):*** É usada para consolidar novas funcionalidades antes de serem integradas à produção.

***Branches de Funcionalidade (feature):*** Cada nova funcionalidade é desenvolvida em sua própria branch, que é criada a partir de develop e mergeada após a finalização e revisão.

[imagem]

### Controle de Mudanças

As mudanças no código são controladas por meio de um fluxo de Pull Requests (PR) e revisões obrigatórias antes da integração. Para cada PR:

- As mudanças são testadas e revisadas por outros membros da equipe (mínimo duas aprovações).
- São executados testes automatizados para garantir a estabilidade e a integridade do código.

[imagem]

### Identificação de Itens de Configuração e Automação

***Docker para Contêinerização:*** Utilizamos Dockerfiles para definir as configurações do ambiente, garantindo que o desenvolvimento, os testes e a produção sejam realizados em ambientes consistentes. Cada serviço possui seu próprio Dockerfile, o que permite a replicação fácil do ambiente e facilita o CI/CD.

***Integração Contínua e Deploy Contínuo (CI/CD):*** Implementamos pipelines de CI/CD para automatizar os testes e a implantação. Cada alteração enviada ao repositório dispara um pipeline que realiza testes, build e, se aprovado, realiza o deploy da aplicação.

[imagem]

Esse plano de Gerenciamento de Configuração permite uma coordenação eficiente entre equipes e garante que o desenvolvimento e a produção permaneçam consistentes e seguros, facilitando a escalabilidade e a manutenção da aplicação.
