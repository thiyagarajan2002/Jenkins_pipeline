# Set the base image as python
FROM python:3.8

# Set the working directory inside container 
WORKDIR /home/project

# Copy the project file
COPY app.py requirements.txt data.json /home/project/

# Install dependencies
RUN pip install -r requirements.txt

# Run the flask application in backgroung
RUN nohup python app.py > flask.log 2>&1 &


