🚀 Feedback App (Versão Flutter)
Este projeto é a evolução do front-end do Feedback App, reconstruído com Flutter Web para proporcionar uma experiência de usuário mais moderna, robusta e escalável. A aplicação permite a coleta de feedbacks de clientes sobre serviços prestados, integrando-se diretamente com o mesmo back-end.

✨ Tecnologias Utilizadas
📱 Front-end: Flutter Web

💾 Back-end & API: Supabase – Banco de dados PostgreSQL com API REST integrada

📊 Análise de Dados: Power BI – Painéis dinâmicos para visualização dos dados

☁️ Hospedagem: Vercel – Hospedagem do front-end com deploy contínuo

🐙 Versionamento: Git + GitHub

📌 Funcionalidades
Interface Moderna: Interface de usuário moderna e responsiva construída com o framework Flutter.

Formulário Inteligente: Formulário para envio de feedbacks com validação de dados em tempo real.

Coleta de Dados: Permite coletar o nome do profissional avaliado, notas de qualidade e pontualidade (1-5), e um comentário opcional.

Integração Direta: Comunicação via API com o banco de dados no Supabase para armazenamento instantâneo dos feedbacks.

Análise Consolidada: Os dados continuam sendo analisados e visualizados em tempo real através do dashboard no Power BI.

🧪 Como Testar (Online)
Acesse a Aplicação

Link: [https://feedback-app-flutter.vercel.app/]

Assim que o deploy na Vercel for concluído com sucesso, você poderá colocar a URL final aqui.

Envie um Feedback

Preencha os campos do formulário:

Nome do profissional

Nota da qualidade do serviço (1 a 5)

Nota da pontualidade (1 a 5)

Comentário (opcional)

Clique em "Enviar Feedback".

Visualize os Dados

Os dados serão enviados para o Supabase e poderão ser visualizados no mesmo painel do Power BI que você já utiliza.

🛠️ Instalação e Configuração Local (dev)
Para executar este projeto localmente, você precisará ter o Flutter SDK instalado na sua máquina.

Bash

# 1. Clone este repositório
git clone [COLE AQUI A URL DO SEU REPOSITÓRIO FLUTTER NO GITHUB]

# 2. Navegue até a pasta do projeto
cd feedback-app-flutter

# 3. Instale as dependências do projeto
flutter pub get

# 4. Execute o aplicativo no Chrome em modo de desenvolvimento
flutter run -d chrome
O aplicativo será aberto em uma nova janela do navegador. Qualquer alteração que você fizer no código será refletida em tempo real com o "Hot Reload".