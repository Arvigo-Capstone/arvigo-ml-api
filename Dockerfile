# Base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Set environment variable for protobuf
ENV PROTOCOL_BUFFERS_PYTHON_IMPLEMENTATION=python

# Copy the Flask app files to the container's working directory
COPY . /app
RUN apt-get update && apt-get install -y libgl1-mesa-glx
RUN pip install --no-cache-dir --upgrade pip
# Install the required packages
RUN pip install protobuf flask joblib numpy tensorflow opencv-python mediapipe requests scikit-learn pandas keras nltk nvidia-tensorrt fuzzywuzzy python-dotenv scipy

# Expose the port on which the Flask app will run
EXPOSE 80

# Set environment variables
ENV FLASK_APP=server.py
ENV FLASK_RUN_HOST=0.0.0.0

# Command to run the Flask app
CMD ["flask", "run"]
