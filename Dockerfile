FROM python:3.8.5-slim-buster

ENV PIP_NO_CACHE_DIR 1

RUN sed -i.bak 's/us-west-2\.ec2\.//' /etc/apt/sources.list

# Group 1 - Basic tools
RUN apt update && apt upgrade -y && \
    apt install --no-install-recommends -y \
    bash bzip2 curl git wget unzip sudo jq pv figlet util-linux openssl

# Group 2 - Build deps
RUN apt install --no-install-recommends -y \
    gcc musl musl-dev libffi-dev libssl-dev libreadline-dev \
    libyaml-dev zlib1g libsqlite3-dev sqlite3 \
    libcurl4-openssl-dev libxml2-dev libxslt1-dev

# Group 3 - Image/media
RUN apt install --no-install-recommends -y \
    libjpeg-dev libjpeg62-turbo-dev libwebp-dev \
    ffmpeg libopus0 libopus-dev

# Group 4 - Display
RUN apt install --no-install-recommends -y \
    libgconf-2-4 libxi6 xvfb

# Group 5 - PostgreSQL
RUN apt install --no-install-recommends -y \
    postgresql postgresql-client libpq-dev

# Group 6 - Python packages
RUN apt install --no-install-recommends -y \
    python3 python3-dev python3-pip \
    python3-lxml python3-psycopg2 python3-requests \
    python3-sqlalchemy python3-tz python3-aiohttp

# Group 7 - Debian keyring
RUN apt install --no-install-recommends -y \
    debian-keyring debian-archive-keyring

RUN rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp

RUN pip3 install --upgrade pip setuptools

RUN git clone https://github.com/Mynameishekhar/ptb /root/ptb
WORKDIR /root/ptb

ENV PATH="/home/bot/bin:$PATH"

RUN pip3 install -U -r requirements.txt

CMD ["python3", "-m", "shivu"]
