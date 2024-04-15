install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt


		
lint:
	pylint --disable=R,C *.py devopslib

test:
	python -m pytest -vv --cov=devopslib test_*.py

format: 
	black *.py devopslib/*.py

post-install:
	python -m textblob.download_corpora

deploy:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 758560478625.dkr.ecr.us-east-1.amazonaws.com
	docker build -t devops-python .
	docker tag devops-python:latest 758560478625.dkr.ecr.us-east-1.amazonaws.com/devops-python:latest
	docker push 758560478625.dkr.ecr.us-east-1.amazonaws.com/devops-python:latest

all: install post-install lint test format deploy