FROM python:3.11-slim
ENV PIP_NO_CACHE_DIR=1 PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PORT=8080
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

# copy the whole repo into the image
COPY . .

CMD ["streamlit","run","app.py","--server.port=8080","--server.address=0.0.0.0","--browser.gatherUsageStats=false"]
