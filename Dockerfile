# Pull base image.
FROM ubuntu:22.04

# Set default WORKDIR in container
WORKDIR /code
# # For log message in container
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get -y install python3
RUN apt -y install python3-pip
RUN apt-get -y install cron
# Set timezone
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata
RUN TZ=Asia/Taipei \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata 

# Copy file into container
COPY ./ /code

# Install package
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt


# Copy hello-cron file to the cron.d directory
COPY auto-rm /etc/cron.d/auto-rm
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/auto-rm
RUN chmod +x /code/auto-rm.sh

# Apply cron job
RUN crontab /etc/cron.d/auto-rm


CMD echo $DAY > "/code/day" & echo $DEL_WAV > "/code/DEL_WAV" & gunicorn -w 1 -b 0.0.0.0:8001 run:app -k uvicorn.workers.UvicornWorker -t 0 --error-logfile ./static/error.log --capture-output --log-level debug & cron -f

