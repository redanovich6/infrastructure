FROM python:3.7-stretch

LABEL version="1.0" \
              description="SoSTrades - Base" \
              creationDate="2022-04"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

#------------------------------------------------------------------------------
# Install path for sostrades sources
RUN mkdir /usr/local/sostrades
WORKDIR /usr/local/sostrades/
ENV SOSTRADES_REPO_PATH=/usr/local/sostrades/

#------------------------------------------------------------------------------
# Install path for tools
RUN mkdir /usr/local/sostrades-tools

#------------------------------------------------------------------------------
# Update source.list
RUN echo "deb http://deb.debian.org/debian buster main" | tee -a /etc/apt/sources.list

#------------------------------------------------------------------------------
# Install Prerequisites
RUN apt-get update --fix-missing && \
    apt-get install -y wget bzip2 ca-certificates git vim xmlsec1 libxmlsec1-dev pkg-config gcc default-libmysqlclient-dev build-essential libsasl2-dev python3-dev libldap2-dev libssl-dev procps mpi mpich libblas-dev liblapack-dev unixodbc-dev &&\
    apt-get clean
RUN pip install gunicorn numpy pyparsing==2.4.2 python-gitlab kubernetes gitpython  pylint==2.4.2

#------------------------------------------------------------------------------
# Install Prerequisites for pyodbc
COPY binaries/msodbcsql17_17.8.1.1-1_amd64.deb /tmp/binaries/
RUN apt install unixodbc -y
RUN yes | dpkg -i /tmp/binaries/msodbcsql17_17.8.1.1-1_amd64.deb

#------------------------------------------------------------------------------
# Extract source code to install python dependencies

EXPOSE 8000
ENTRYPOINT ["/bin/bash","/startup/commands.sh"]



