	ARG DOCKER_TAG=latest
FROM docker.io/cesaraugustoo/base-notebook:${DOCKER_TAG}

USER root
ENV GITDIR=/srv/git

RUN dnf -y install git libgomp gcc
RUN mkdir -p $GITDIR && chown $NB_UID:$NB_GID $GITDIR && ln -s /home/$NB_USER $GITDIR/work

USER $NB_USER
WORKDIR $GITDIR

# Cirq, QISKit, QuTiP
RUN source activate && pip install cirq && pip install qiskit && pip install qiskit-terra[visualization]

# OpenFermion
RUN source activate && LC_ALL=en_US.UTF-8 pip install \
	cython openfermion openfermionpyscf openfermionpsi4 openfermioncirq forestopenfermion sfopenboson 
# hackery - users need write access to openfermion/data (!)
RUN chown -R $NB_UID:$NB_GID $CONDA_DIR/lib/python3.6/site-packages/openfermion/data
RUN git clone https://github.com/quantumlib/OpenFermion && git clone https://github.com/kevinsung/OpenFermion-Hands-On-Tutorials

# QuTiP
RUN conda install qutip && conda clean -tipsy
