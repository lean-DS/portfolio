FROM python:3.11-slim
ENV PYTHONUNBUFFERED=1 PIP_NO_CACHE_DIR=1 PORT=8080 \
    STREAMLIT_SERVER_HEADLESS=true STREAMLIT_SERVER_PORT=8080 \
    STREAMLIT_BROWSER_GATHERUSAGESTATS=false
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
EXPOSE 8080
CMD ["python","-m","streamlit","run","app.py","--server.port=8080","--server.address=0.0.0.0"]

