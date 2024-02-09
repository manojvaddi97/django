FROM ubuntu

WORKDIR /app

COPY requiremets.txt /app

COPY MyProject /app

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install -r requirements.txt && \
    cd MyProject

ENTRYPOINT ["python3"]
CMD  ["manage.py", "runserver" , "0.0.0.0:8000"]
