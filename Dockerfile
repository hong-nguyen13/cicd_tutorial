FROM ubuntu:latest
MAINTAINER Hong Nguyen "nguyenb210567@student.ctu.edu.vn"

RUN apt update -y
RUN apt install -y python3-pip python3-dev build-essential python3-venv

ADD . /flask_app
WORKDIR /flask_app

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN pip3 install --no-cache-dir -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["/opt/venv/bin/python3"]
CMD ["flask_docker.py"]
