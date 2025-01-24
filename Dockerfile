# Set the base image as python
FROM ubuntu

# Install python and pip also install venv
RUN apt-get update && apt-get install -y python3 python3-pip && apt install python3-venv -y

# Set the working directory inside container 
WORKDIR /home/project

# Activate venv
RUN python3 -m venv myenv

# Copy the project file
COPY app.py requirements.txt data.json /home/project/

# Install dependencies
RUN pip install -r requirements.txt

# Run the flask application in backgroung
RUN nohup python app.py > flask.log 2>&1 &


