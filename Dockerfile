FROM python:3.8

# working directory
WORKDIR /user/src/app

# copy all files to the container
COPY . .

# Install pip requirements
RUN python -m pip install --no-cache-dir -r requirements.txt

# port number to expose
EXPOSE 5000

# run the web service on the container using gunicorn
CMD exec gunicorn --build :$PORT --worker 1 --threads 8 --timeout 0 app:app