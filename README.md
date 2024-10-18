1. Criação da aplicação:

1.1 Criação da pasta “hello-world”: em que foram criados os arquivos de aplicação e requisitos, além do deployment e service.

Comandos utilizados:
 mkdir (para criar a pasta) 
cd (para acessá-la)
code . (para utilizar o VS code para escrever os códigos)
Set-ExecutionPolicy RemoteSigned (para ativar a execução de scripts)
.\venv\Scripts\Activate (para criar o ambiente virtual)
pip install flask (para instalar a biblioteca Flask)
pip freeze > .\requirements.txt (para verificar se a biblioteca foi instalada corretamente no ambiente virtual)

 Ações necessárias: 
ativar a execução de scripts;
criar um ambiente virtual e instalar a biblioteca “Flask” nesse ambiente.

2. Criação do Dockerfile e da imagem

2.1 Criação do Dockerfile: o tipo de imagem “Alpine”, pois não seriam utilizadas muitas bibliotecas

2.2 Criação e publicação da imagem

Comandos utilizados
docker build -t (para construir a imagem)
docker run -p 5000:5000 (para rodar a imagem)
docker push (para publicar a imagem no Docker Hub)

3. Deploy no minikube

3.1 Criação do deployment e aplicação do deployment: o arquivo “deployment.yaml” foi criado na mesma pasta dos outros arquivos

Comandos utilizados: 
minikube start (para iniciar o minikube)
kubectl apply -f deployment.yaml (para aplicar o deployment)

3.2 Exposição do deployment
Comandos utilizados: 
kubectl expose deployment hello-world-app --type=NodePort --port=5000 (para expor o deployment com o service)

3.3 Verificação do IP

Comandos utilizados:
minikube service hello-world-service --url (para verificar o IP e acessar a aplicação)


4. Pipeline CI/CD

4.1 Criação do repositório

Comandos utilizados:
cd (navegar até a pasta)
git init (iniciar o repositório)
git add . (adicionar todos os arquivos do repositório) - esqueci de tirar o venv :(
git commit -m (pra fazer o primeiro commit de alterações)

4.2 Conexão o repositório local ao do github

Comandos utilizados:
git remote add origin (adicionar o repositório remoto)
git push -u origin main (enviar os arquivos para o repositório do github)

4.3 Criação da pasta workflows: onde o arquivo de configuração foi colocado
4.4 Adição das credenciais (secrets) com o github actions: foram criadas duas chaves, uma pra o nome de usuário e outra para a senha
4.5 Atualização do código no repositório: foram usados os mesmos comandos (git add, git commit e git push)
