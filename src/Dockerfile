FROM alpine:3.6

# Add the packages
RUN apk add --no-cache python
RUN apk add --no-cache --virtual .build-deps py-pip python-dev musl-dev gcc mariadb-dev py-gunicorn

RUN mkdir -p /app

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

RUN chown -R 1001:1001 /app

USER 1001

EXPOSE 3000

ENTRYPOINT ["python","app.py"]


#CMD ["gunicorn", "-b", "0.0.0.0:3000", "app:application"]
