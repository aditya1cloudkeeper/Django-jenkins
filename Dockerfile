FROM python:3.11-slim

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y python3-distutils

# Upgrade pip and install dependencies
RUN pip install --upgrade pip
RUN pip install django==3.2

# Copy your project files
COPY . .

# Run migrations
RUN python manage.py migrate

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
