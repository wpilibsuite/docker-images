FROM  ubuntu:18.04

RUN apt-get update && apt-get install -y build-essential redis-server \
    python3.7 python3.7-dev \
    python3 python3-dev python3-pip \
    python2.7 python-dev \
    libxml2-dev libxslt1-dev zlib1g-dev \
    git

ENV DOCKER_ENABLE True

RUN git clone --recurse-submodules --depth=1 https://github.com/daltz333/readthedocs.org.git

WORKDIR readthedocs.org

RUN python3.7 -m pip install -r requirements.txt

RUN python3.7 -m pip install virtualenv==16.7.9

RUN python3.7 manage.py migrate

RUN python3.7 manage.py createsuperuser --username wpiadmin --email noemail@example.com --noinput

RUN python3.7 manage.py collectstatic

RUN python3.7 manage.py loaddata test_data

EXPOSE 8000

CMD ["python3.7", "manage.py", "runserver", "0.0.0.0:8000"]