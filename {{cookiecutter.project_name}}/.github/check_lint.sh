#!/bin/bash
set -euxo pipefail

poetry run cruft check
poetry run mypy --ignore-missing-imports {{cookiecutter.project_name}}/
poetry run isort --check --diff {{cookiecutter.project_name}}/ tests/
poetry run black --check {{cookiecutter.project_name}}/ tests/
poetry run flake8 {{cookiecutter.project_name}}/ tests/
poetry run bandit -r {{cookiecutter.project_name}}/
poetry run vulture
echo "Lint successful!"