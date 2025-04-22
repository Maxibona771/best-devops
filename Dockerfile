FROM python:3.10-slim

# Создаем нового пользователя (без root)
RUN useradd -m appuser

# Устанавливаем рабочую директорию
WORKDIR /app

# Устанавливаем зависимости прямо здесь
RUN pip install --no-cache-dir flask flask_sqlalchemy psycopg2-binary gunicorn

# Копируем все файлы проекта внутрь контейнера
COPY . .

# Меняем владельца файлов, чтобы не было проблем с правами
RUN chown -R appuser:appuser /app

# Переключаемся на созданного пользователя
USER appuser

# Открываем нужный порт
EXPOSE 5000

# Запускаем приложение
CMD ["python", "app.py"]
