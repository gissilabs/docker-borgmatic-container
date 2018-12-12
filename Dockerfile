ARG PYTHON_VERSION=3.6-alpine3.7

FROM python:${PYTHON_VERSION} as builder
ENV PYTHONUNBUFFERED 1

WORKDIR /wheels
RUN pip3 wheel borgmatic==1.2.12

FROM python:${PYTHON_VERSION}
COPY --from=builder /wheels /wheels

RUN apk --no-cache add borgbackup openssh-client bash \
    && pip3 install -f /wheels borgmatic==1.2.11 \
    && rm -fr /var/cache/apk/* /wheels /.cache

COPY ./entrypoint.sh /entrypoint.sh

WORKDIR /
ENTRYPOINT ["/entrypoint.sh"]
