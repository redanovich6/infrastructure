FROM idlvsrv201.eu.airbus.corp/sostrades/python:3.7-stretch

LABEL version="1.0" \
              description="SoSTrades - Ontology" \
              creationDate="2022-04"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

#------------------------------------------------------------------------------
# Create sostrades directories
RUN mkdir /usr/local/sostrades && mkdir /startup
WORKDIR /usr/local/sostrades/

#------------------------------------------------------------------------------
# Clone git repo & install dependency
RUN git clone https://idas661.eu.airbus.corp/sostrades/sostrades-ontology.git -b develop
RUN pip install gunicorn pandas

#------------------------------------------------------------------------------
# Install repository python dependencies
WORKDIR /usr/local/sostrades/sostrades-ontology
RUN pip install -r requirements.txt

#------------------------------------------------------------------------------
# Expose API port
EXPOSE 5555

#------------------------------------------------------------------------------
# Launch boot script
ENTRYPOINT ["bash","/startup/entrypoint.sh"]
