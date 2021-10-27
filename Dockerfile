FROM docker.io/rust:slim-bullseye AS slim-bullseye-cargo-index

COPY /cobhan/library/rust /cobhan

WORKDIR /cobhan/libcobhandemo

RUN cargo update

FROM docker.io/rust:slim-bullseye AS libcobhandemo-build-bullseye-slim

COPY --from=slim-bullseye-cargo-index /usr/local/cargo /usr/local/cargo

