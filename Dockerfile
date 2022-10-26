FROM python:3.8

# working directory
WORKDIR /user/src/app

ENV PORT 8080
ENV HOST 0.0.0.0

# copy all files to the container
COPY . .

# Install pip requirements
RUN python -m pip install --no-cache-dir -r requirements.txt

# port number to expose


# run the web service on the container using gunicorn
CMD exec gunicorn --build :$PORT --worker 1 --threads 8 --timeout 0 app:app