# Etapa 1: Construir la aplicación
FROM node:18-alpine AS build  

# Crear el directorio de trabajo
WORKDIR /app

# Copiar el archivo package.json y package-lock.json (o yarn.lock) para la instalación de dependencias
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del proyecto
COPY . .

# Construir la aplicación Astro
RUN npm run build

# Etapa 2: Servir la aplicación
FROM node:18-alpine  

# Crear un directorio de trabajo
WORKDIR /app

# Copiar solo los archivos necesarios para servir la aplicación
COPY --from=build /app/dist ./dist

# Instalar un servidor estático (puede ser http-server o cualquier otro que prefieras)
RUN npm install -g serve

# Exponer el puerto donde se servirá la aplicación
EXPOSE 3000

# Comando para servir la aplicación
CMD ["serve", "-s", "dist", "-l", "3000"]
