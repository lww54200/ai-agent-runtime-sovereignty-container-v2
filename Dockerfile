FROM alpine:3.20
RUN apk add --no-cache bash coreutils e2fsprogs util-linux cryptsetup
RUN adduser -D -h /agent agent
WORKDIR /agent
COPY scripts/ /usr/local/bin/
RUN chmod +x /usr/local/bin/*.sh && mkdir -p /secure-state /agent/work && chown -R agent:agent /agent /secure-state
USER agent
ENTRYPOINT ["/usr/local/bin/agent-entrypoint.sh"]
