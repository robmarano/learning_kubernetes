FROM python:3.6
ADD . /app
WORKDIR /app
RUN pip install -r requirements.txt
#CMD ["gunicorn", "-c ", "config.py", "app:app"]
#CMD ["/bin/bash"]
EXPOSE 8000
ENTRYPOINT [ "gunicorn", "-c", "config.py", "app:app" ]
