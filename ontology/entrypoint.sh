pwd
git pull
pip install -r requirements.txt
gunicorn sos_ontology.rest_api.api:app --bind 0.0.0.0:5555 --limit-request-line 0 --timeout 120
