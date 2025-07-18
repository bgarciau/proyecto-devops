# Usa una imagen base oficial de Python
FROM python:3.9-slim

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo de requerimientos y los instala para aprovechar el cache de Docker
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo el código de la aplicación al directorio de trabajo
COPY . .

# Expone el puerto que la aplicación usará
EXPOSE 5000

# Comando para ejecutar la aplicación cuando el contenedor inicie
CMD ["uvicorn", "run:app", "--host", "0.0.0.0", "--port", "8000"]