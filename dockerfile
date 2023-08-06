# The builder image, used to build the virtual environment
FROM arm32v7/python:3.11-bookworm as builder

RUN curl https://sh.rustup.rs -sSf | nohup sh -s -- -y --profile minimal
ENV PATH="/root/.cargo/bin:${PATH}"

RUN pip install -U pip && pip install cryptography==41.0.3
