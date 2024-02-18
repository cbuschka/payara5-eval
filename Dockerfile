FROM payara/server-full:5.2022.5

# ADMIN_USER - the username to use for the asadmin utility.
# PASSWORD_FILE - the password file to use for the asadmin utility.
# PREBOOT_COMMANDS - the pre boot command file.
# PREBOOT_COMMANDS_FINAL - copy of the pre boot command file.
# POSTBOOT_COMMANDS - the post boot command file.
# POSTBOOT_COMMANDS_FINAL - copy of the post boot command file.
# DOMAIN_NAME - the name of the domain to start.
# JVM_ARGS - extra JVM options to pass to the Payara Server instance.
# AS_ADMIN_MASTERPASSWORD - the master password for the Payara Server instance.

ENV LIBS_DEPLOY_DIR=${PAYARA_DIR}/libs/
RUN mkdir -p ${LIBS_DEPLOY_DIR}
# entrypoint executes *.sh scripts under ${SCRIPT_DIR}/init_* and ${SCRIPT_DIR}/init.d/*.
# finally: exec ${SCRIPT_DIR}/startInForeground.sh $PAYARA_ARGS
COPY assets/init-scripts/* ${SCRIPT_DIR}

COPY generated/example.ear ${DEPLOY_DIR}/
# COPY libs to ${PAYARA_DIR}/glassfish/domains/${DOMAIN_NAME}/lib/

RUN echo "create-jvm-options --target=server-config '\-Djava.awt.headless=true'"  >> $POSTBOOT_COMMANDS
#	echo "generate-self-signed-certificate --dn \"CN=test.payara.fish,IP=127.0.0.1\" mydomain_certificate
# ssl config: https://docs.payara.fish/enterprise/docs/documentation/payara-server/server-configuration/ssl-certificates.html
#RUN echo "remove-expired-certificates" >> $POSTBOOT_COMMANDS
# create-jvm-options "-Dfish.payara.ssl.additionalKeyStores=/path/to/keystore.jks\:/path2/to/keystore2.jks"
# create-jvm-options "-Dfish.payara.ssl.additionalTrustStores=/path/to/truststore.jks\:/path2/to/truststore2.jks"


