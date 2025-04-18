# Используем официальный образ Python
FROM python:3.10-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы проекта
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ ./app

# Указываем рабочую директорию приложения
WORKDIR /app/app

# Открываем нужный порт
EXPOSE 5000

# Команда для запуска
CMD ["python", "app.py"]
