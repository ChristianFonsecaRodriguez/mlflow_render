FROM python:3.11-slim

# Instala MLflow y los extras que necesites (p.ej. S3, Postgres)
RUN pip install --no-cache-dir "mlflow==2.15.1[extras]"

# Crea directorio de trabajo
WORKDIR /app

# Expone el puerto donde Render inyecta $PORT
EXPOSE $PORT

# Comando por defecto: arranca el servidor de MLflow
# Backend store y artifact root se configuran vía variables de entorno
CMD mlflow server \
     --host 0.0.0.0 \
     --port $PORT 