FROM docker.io/rust:slim-bullseye AS slim-bullseye-cargo-index

RUN apt-get update && apt-get upgrade -y && apt-get install git -y

COPY /cobhan /cobhan

COPY /libcobhandemo /libcobhandemo

WORKDIR /libcobhandemo

RUN cargo update

FROM docker.io/rust:slim-bullseye AS libcobhandemo-build-bullseye-slim

COPY --from=slim-bullseye-cargo-index /usr/local/cargo /usr/local/cargo

COPY /cobhan /cobhan

COPY /libcobhandemo /libcobhandemo

WORKDIR /libcobhandemo

RUN cargo build
