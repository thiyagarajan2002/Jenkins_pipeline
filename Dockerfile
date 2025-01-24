# Set the base image as python
FROM ubuntu

# Install python and pip
# Install Python 3 and pip for Python 3
RUN apt-get update && apt-get install -y python3 python3-pip

# Set the working directory inside container 
WORKDIR /home/project

# Copy the project file
COPY app.py requirements.txt data.json /home/project/

# Install dependencies
RUN pip install -r requirements.txt

# Run the flask application in backgroung
RUN nohup python app.py > flask.log 2>&1 &


