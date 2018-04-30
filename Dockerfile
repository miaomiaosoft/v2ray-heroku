
FROM alpine:latest

ENV CONFIG_JSON1={\"log\":{\"access\":\"\",\"error\":\"\",\"loglevel\":\"warning\"},\"inbound\":{\"protocol\":\"vmess\",\"port\": 
ENV CONFIG_JSON2=,\"settings\":{\"clients\":[{\"id\":\" 
ENV CONFIG_JSON3=\",\"alterId\":64}]},\"streamSettings\":{\"network\":\"ws\"}},\"inboundDetour\":[],\"outbound\":{\"protocol\":\"freedom\",\"settings\":{}}} 

ADD https://storage.googleapis.com/v2ray-docker/v2ray /usr/bin/v2ray/
ADD https://storage.googleapis.com/v2ray-docker/v2ctl /usr/bin/v2ray/

COPY entrypoint.sh /entrypoint.sh
COPY rinetd /usr/local/bin/

RUN set -ex \
 && apk --no-cache add ca-certificates iptables \
 && mkdir /var/log/v2ray/ \
 && chmod +x /usr/bin/v2ray/v2ctl \
 && chmod +x /usr/bin/v2ray/v2ray \
 && chmod +x /entrypoint.sh \
 && chmod +x /usr/local/bin/rinetd

ENV PATH /usr/bin/v2ray:$PATH

#ENTRYPOINT /entrypoint.sh

CMD /entrypoint.sh
