#!/bin/bash

DOMAIN_LIB_DIR=${PAYARA_DIR}/glassfish/domains/${DOMAIN_NAME}/lib/

if [ ! -z "${LIBS_DEPLOY_DIR}" ]; then
  if [ -d "${LIBS_DEPLOY_DIR}" ]; then
    for f in ${LIBS_DEPLOY_DIR}; do
      cp ${f} ${DOMAIN_LIB_DIR}
    done
  fi
fi

