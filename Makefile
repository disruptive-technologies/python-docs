PYTHON?=python3
PIP?=pip3
VENV?=venv

SHELL := /bin/bash

.PHONY: docs build venv VENV

venv: $(VENV)/bin/activate

$(VENV)/bin/activate: requirements.txt
	@test -d $(VENV) || $(PYTHON) -m venv $(VENV)
	${VENV}/bin/python -m pip install --upgrade pip
	${VENV}/bin/python -m pip install --upgrade -r requirements.txt
	@touch $(VENV)/bin/activate

docs: venv
	source ${VENV}/bin/activate && cd docs && ${MAKE} clean html

clean:
	rm -rf build/ dist/ pip-wheel-metadata/ *.egg-info .pytest_cache/ .mypy_cache/ $(VENV) coverage.xml
	find . -name '__pycache__' -exec rm --force --recursive {} +
