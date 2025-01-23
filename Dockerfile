# Set the base image as python
FROM python:3.8

# Set the working directory inside container 
WORKDIR /home/project

# Copy the project file
COPY app.py requirements.txt data.json /home/project/

# Install dependencies
RUN pip install -r requirements.txt

# Expose port 5000 for Flask
EXPOSE 5000

# Run Flask with gunicorn (daemon mode runs in the background)
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app", "--daemon"]
