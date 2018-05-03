FROM centos:7

RUN yum -y update && yum clean all

# set locale
RUN yum reinstall -y glibc-common
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
RUN unlink /etc/localtime
RUN ln -s /usr/share/zoneinfo/Japan /etc/localtime

# install python3
RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum install -y python36 && \
    ln -s /usr/bin/python3.6 /usr/bin/python3 && \
    python3 -m ensurepip

RUN mkdir /app
WORKDIR /app

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD python3 main.py
