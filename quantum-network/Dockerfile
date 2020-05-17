ARG DOCKER_TAG=latest
FROM docker.io/cesaraugustoo/quantum-full:${DOCKER_TAG}

USER root
RUN dnf -y install python3-pip

USER $NB_USER

# Simulaqron
RUN source activate && pip3 install simulaqron && pip install service_identity
