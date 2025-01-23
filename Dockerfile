FROM python:3.8

WORKDIR /home/project

COPY app.py requirements.txt data.json /home/project/

RUN pip install -r requirements.txt

CMD ["python", "app.py"]
