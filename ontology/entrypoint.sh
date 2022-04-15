pwd
git pull
pip install -r requirements.txt
gunicorn sos_ontology.rest_api.api:app --certfile=/etc/ssl/private/tls.crt --keyfile=/etc/ssl/private/tls.key --bind 0.0.0.0:5555 --limit-request-line 0 --timeout 120
