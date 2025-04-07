FROM python:3.13-slim  # or your current base image

# Install system dependencies, including distutils
RUN apt-get update && apt-get install -y python3-distutils

# Optionally, upgrade pip and install other dependencies
RUN pip install --upgrade pip
RUN pip install django==3.2

# Copy your project files
COPY . .

# Run migrations
RUN python manage.py migrate

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
