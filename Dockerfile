FROM python:3.6-alpine
LABEL maintainers="j_hao104@163.com,k8scat@gmail.com"
WORKDIR /app
COPY . .
RUN apk add -U tzdata && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apk add --no-cache musl-dev gcc libxml2-dev libxslt-dev && \
    pip install --no-cache-dir -r requirements.txt && \
    apk del gcc musl-dev tzdata
EXPOSE 5010
ENTRYPOINT [ "sh", "start.sh" ]

