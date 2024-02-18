FROM payara/server-full:5.2022.5

COPY generated/example.ear ${DEPLOY_DIR}/

RUN echo "create-jvm-options --target=server-config '\-Djava.awt.headless=true'"  >> $POSTBOOT_COMMANDS

COPY assets/init-scripts/* ${SCRIPT_DIR}
