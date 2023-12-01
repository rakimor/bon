FROM alpine:latest
WORKDIR /bin
RUN addgroup --system bingo \
    && adduser -S -s /bin/false -G bingo bingo -D -H -h /bin 
RUN mkdir -p /bin/.postgresql \
    && wget "https://storage.yandexcloud.net/cloud-certs/CA.pem" \
    --output-document /bin/.postgresql/root.crt \
    && apk --update add postgresql-client curl \
    && chown -R bingo:bingo /bin \
    && chmod 0600 /bin/.postgresql/root.crt
COPY --chown=bingo:bingo ./bin/bingo .
USER bingo
EXPOSE 27411
CMD ["/bin/bingo", "run_server"]
