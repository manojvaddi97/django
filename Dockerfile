FROM ubuntu

WORKDIR /app

COPY requirements.txt /app

COPY MyProject /app

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install -r requirements.txt
    

ENTRYPOINT ["python3", "MyProject/manage.py"]
CMD  ["runserver" , "0.0.0.0:8000"]
