FROM python:3.8.5-slim-buster

ENV PIP_NO_CACHE_DIR 1

# Fix: Buster EOL - point to archive repos
RUN echo "deb http://archive.debian.org/debian buster main" > /etc/apt/sources.list && \
    echo "deb http://archive.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && \
    echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check

RUN apt update && apt upgrade -y && \
    apt install --no-install-recommends -y \
    bash bzip2 curl git wget unzip sudo jq pv \
    figlet util-linux openssl gcc \
    libffi-dev libssl-dev libreadline-dev libyaml-dev \
    zlib1g libsqlite3-dev sqlite3 \
    libcurl4-openssl-dev libxml2-dev libxslt1-dev \
    libjpeg-dev libjpeg62-turbo-dev libwebp-dev \
    ffmpeg libopus0 libopus-dev \
    libxi6 xvfb \
    postgresql postgresql-client libpq-dev \
    python3 python3-dev python3-pip \
    python3-lxml python3-psycopg2 python3-requests \
    python3-sqlalchemy python3-tz python3-aiohttp \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives /tmp

RUN pip3 install --upgrade pip setuptools

RUN git clone https://github.com/gaganhero89-blip/WAIFU-HUSBANDO-CATCHER /root/ptb
WORKDIR /root/ptb

ENV PATH="/home/bot/bin:$PATH"

RUN pip3 install -U -r requirements.txt

CMD ["python3", "-m", "shivu"]
