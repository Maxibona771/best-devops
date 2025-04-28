FROM python:3.9-slim

WORKDIR /application

# Устанавливаем Flask напрямую
RUN pip install Flask==2.0.2 Werkzeug==2.0.2

# Копируем все файлы проекта
COPY ./application /application

EXPOSE 5000

CMD ["python", "app.py"]
