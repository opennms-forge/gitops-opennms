FROM opennms/horizon:32.0.5

WORKDIR /usr/share/opennms

USER 10001

RUN mv etc etc.dist

COPY --chown=10001:10001 etc etc
