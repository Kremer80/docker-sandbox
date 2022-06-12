FROM python:3.8

# Create and set working directory
RUN mkdir /app
WORKDIR /app

# Add current directory code to working directory
ADD . /app/

# Set default enviroment variables
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive


# Install dependencies
RUN apt-get update
RUN apt-get install -y tesseract-ocr tesseract-ocr-deu libtesseract-dev libleptonica-dev pkg-config
RUN apt-get install -y poppler-utils
RUN apt-get install -y libopencv-dev

RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev
RUN pip install gunicorn

