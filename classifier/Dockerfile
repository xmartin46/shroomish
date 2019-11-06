FROM python:3.6-slim
COPY ./app.py /deploy/
COPY ./requirements.txt /deploy/
COPY ./classifier.h5 /deploy/
WORKDIR /deploy/
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python","-u","app.py"]
