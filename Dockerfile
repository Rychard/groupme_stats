FROM python:2.7-alpine

RUN pip install requests

WORKDIR /scripts

ADD *.py ./

ENTRYPOINT ["python", "retrieve_msgs.py"]