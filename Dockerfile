# ----------- Этап сборки ----------- #
# Используем официальный образ Python как базовый
FROM python:3.9 as build-stage

# Устанавливаем рабочую директорию внутри образа
WORKDIR /app

# Копируем текущую директорию в рабочую директорию внутри образа
COPY . .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Команда для запуска приложения
CMD ["python", "app.py"]

# ----------- Этап исполнения ----------- #
FROM python:3.9-alpine AS runtime-stage
WORKDIR /app
COPY --from=build-stage /app /app
RUN pip install --no-cache-dir -r requirements.txt
CMD ["python", "app.py"]