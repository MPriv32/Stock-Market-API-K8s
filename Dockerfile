FROM bitnami/kubectl:1.20.9 as kubectl

FROM python:3.8

COPY app.py .

RUN pip install requests python-dotenv
                                                                                                                                       
ARG API_KEY                                                                                                                     
ARG EMAIL_USER                                                                                                                     
ARG EMAIL_PASSWORD                                                                                                                     
                                                                                                                     
ENV API_KEY $API_KEY                                                                                                                     
ENV EMAIL_USER $EMAIL_USER                                                                                                                     
ENV EMAIL_PASSWORD $EMAIL_PASSWORD                                                                                                                     
                                                                                                                     
COPY dynamodb.py .                                                                                                                     
                                                                                                                     
RUN pip install boto3                                                                                                                     
                                                                                                                     
ARG ACCESS_KEY                                                                                                                     
ARG SECRET_KEY                                                                                                                     
                                                                                                                     
ENV ACCESS_KEY $ACCESS_KEY                                                                                                                     
ENV SECRET_KEY $SECRET_KEY                                                                                                                     
                                                                                                                                       
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/                                                                                                                                       
                                                                                                                                       
CMD ["python", "database.py"]                                                                                                                                                                                                                                                                             
