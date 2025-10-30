# Use the official Python 3.12 image as a base
FROM python:3.12-slim-bookworm

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first for efficient caching
COPY requirements.txt .

# Install all Python dependencies
# --no-cache-dir saves space
RUN pip install --no-cache-dir -r requirements.txt

# Copy all your project files into the container
# This includes .py files and the kilimomodelV3 folder
COPY . .

# Expose the port Runpod will use
EXPOSE 8080

# The command Runpod will use to start your handler
# This starts the lightweight Python server provided by Runpod
CMD ["python", "-m", "runpod.serverless"]