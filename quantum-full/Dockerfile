ARG DOCKER_TAG=latest
FROM docker.io/fermilabqc/quantum-lite:${DOCKER_TAG}

USER root
RUN dnf -y install gcc gcc-c++

USER $NB_USER

# PyQuil - Rigetti
RUN source activate && pip install pyquil

# ProjectQ
RUN source activate && pip install pybind11
RUN LC_ALL=en_US.UTF-8 pip install projectq

# qiskit-aqua
# RUN source activate && pip install qiskit-aqua==0.3.0

RUN conda install nb_conda && conda clean -tipsy

RUN conda config --add channels http://conda.anaconda.org/psi4 && conda install psi4 && conda clean -tipsy

RUN source activate && LC_ALL=en_US.UTF-8 pip install openfermionpyscf openfermionpsi4

RUN git clone https://github.com/quantumlib/OpenFermion-PySCF && git clone https://github.com/quantumlib/OpenFermion-Psi4
