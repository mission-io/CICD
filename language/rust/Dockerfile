FROM rust:latest as build
WORKDIR /ws
COPY . ./
RUN rustup default nightly && \
    rustup target add x86_64-unknown-linux-musl && \
    rustc --version && \
    cargo --version && \
    cargo build --release --target x86_64-unknown-linux-musl

FROM alpine:latest
COPY --from=build /ws/target/x86_64-unknown-linux-musl/release/<app-name> ./ 
COPY --from=build /ws/templates ./templates
EXPOSE 8000
CMD ["./<app-name>"]
