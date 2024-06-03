# Usar uma imagem base do Node.js
FROM node:18-slim

# Instalar pnpm globalmente
RUN npm install -g pnpm

# Criar e definir o diretório de trabalho
WORKDIR /usr/src/app

# Copiar os arquivos package.json
COPY package*.json ./

# Instalar as dependências do projeto.;.
RUN pnpm install

# Copiar o restante do código do aplicativo
COPY . .

# Construir o aplicativo
RUN pnpm run build

# Expor a porta na qual a aplicação irá rodar
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["pnpm", "run", "start"]