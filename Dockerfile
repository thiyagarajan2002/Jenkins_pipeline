# Set the base image as python
FROM python:3.8

# Set the working directory inside container 
WORKDIR /home/project

# Create a non-root user
RUN useradd -m flaskuser

# Create the project directory
RUN mkdir -p /home/project 

# Copy the project file
COPY app.py requirements.txt data.json /home/project/

# Change ownership of the files
RUN chown -R flaskuser:flaskuser /home/project

# Install dependencies
RUN pip install -r requirements.txt

# Install supervisor
RUN apt-get update && apt-get install -y supervisor

# Copy the supervisor config file
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Switch to this user
USER flaskuser

# Expose port 5000 for Flask
EXPOSE 5000

# Use supervisor to run Gunicorn in background mode
CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]


