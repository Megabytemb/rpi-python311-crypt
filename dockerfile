# The builder image, used to build the virtual environment
FROM arm32v7/python:3.11-slim-bookworm as cryptographybuilder

RUN apt-get update && \
    apt-get install -qq --no-install-recommends build-essential libssl-dev libffi-dev rustc && \
    rm -rf /var/lib/apt/lists/*
RUN pip install cryptography==41.0.3

FROM arm32v7/python:3.11-slim-bookworm
COPY --from=cryptographybuilder /root/.cache /root/.cache