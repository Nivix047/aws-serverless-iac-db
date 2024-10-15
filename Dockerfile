# Use an official Python runtime as a base image
FROM python:3.11

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install the dependencies in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# You can leave out CMD or ENTRYPOINT to not run any specific command
