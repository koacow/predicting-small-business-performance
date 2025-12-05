VENV := env
PIP := $(VENV)/bin/pip

.PHONY: venv install build clean

# Create a virtual environment
venv:
	$(python3) -m venv $(VENV)

# Install all Python dependencies from requirements.txt
install: venv
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Build step: byte-compile all Python files (safe no-op if none yet)
build: install
	$(python3) -m compileall .

# Remove virtualenv and compiled artifacts
clean:
	rm -rf $(VENV) __pycache__ */__pycache__
