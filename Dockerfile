FROM ubuntu:20.04
ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# Copying install_dependencies.sh & give permissions
COPY install_dependencies.sh /
RUN chmod +x /install_dependencies.sh

# install dependencies - making some changes here to test 
RUN ./install_dependencies.sh && \
    apt-get update && \
    /usr/bin/python3 -m pip install --upgrade pip

# Install the Python requirements.
RUN pip3 --no-cache-dir install --upgrade setuptools && \
    pip3 --no-cache-dir install wheel

COPY poetry.lock /
COPY pyproject.toml /

RUN pip install --upgrade pip \
    && pip install poetry \
    && poetry config virtualenvs.create false \
    && poetry install --no-dev \
    && pip cache purge

# Making home & test folders
RUN mkdir geemap && \
    mkdir tests

# Copying tests
COPY /tests/test_geemap.py /tests
COPY /tests/run_tests.sh /tests

# Giving permission to tests to run
RUN chmod +x /tests/test_geemap.py && \
    chmod +x /tests/run_tests.sh

WORKDIR /geemap