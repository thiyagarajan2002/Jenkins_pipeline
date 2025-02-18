# Set the base image as python
FROM ubuntu

# Install python, pip and venv
RUN apt-get update && apt-get install -y python3 python3-pip && apt install python3-venv -y

# Set the working directory inside container
WORKDIR /home/project

# Create a virtual environment
RUN python3 -m venv /env

# Copy the project files into the container
COPY app.py requirements.txt data.json /home/project/

# Activate the virtual environment and install dependencies
RUN /env/bin/pip install --no-cache-dir -r requirements.txt

# Expose port 5000 for the Flask application
EXPOSE 5000

# Set the command to run the Flask app using the virtual environment's Python interpreter
CMD ["/env/bin/python3", "app.py"]
