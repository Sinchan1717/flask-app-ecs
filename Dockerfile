# Use Python 3.7 image
FROM python:3.7

# Install system dependencies
RUN apt-get update -y && apt-get install -y python3-distutils

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./ /app

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Set environment variables
ENV FLASK_APP=run.py
ENV FLASK_ENV=production

# Expose the port Flask runs on
EXPOSE 5000

# Run the application
ENTRYPOINT ["python"]
CMD ["run.py"]
