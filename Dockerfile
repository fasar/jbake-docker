FROM adoptopenjdk:11-jre-hotspot

# This is a base image that install and configures JBake.
# Child Dockerfiles can run command `jbake` to bake or anything else.


# Define environment variables.
ENV JBAKE_HOME=/opt/jbake
ENV JBAKE_USER=jbake
ENV JBAKE_VERSION=2.6.4
ENV PATH ${JBAKE_HOME}/bin:$PATH

CMD ["bash"]


# Create the env to run JBake
RUN adduser --system --disabled-password --group --gecos "" ${JBAKE_USER} && \ 
    cd /opt && \
    curl -O -L https://dl.bintray.com/jbake/binary/jbake-${JBAKE_VERSION}.tar && \
    tar -xf jbake-${JBAKE_VERSION}.tar  && \
    rm jbake-${JBAKE_VERSION}.tar && \
    ln -s  /opt/jbake-${JBAKE_VERSION} ${JBAKE_HOME}  && \
    chown ${JBAKE_USER}:${JBAKE_USER} -R /opt/jbake* && \
    rm -rvf /opt/jbake-${JBAKE_VERSION}/example*

USER ${JBAKE_USER}

# CMD ["java", "-classpath", "${JBAKE_HOME}/lib/logging:${JBAKE_HOME}/lib/*", "org.jbake.launcher.Main", "/www", "public"]
CMD ["${JBAKE_HOME}/bin/jbake", ".", "./public"]

