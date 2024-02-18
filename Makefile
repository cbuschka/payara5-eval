PROJECT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

run:	build
	@cd ${PROJECT_DIR}
	docker rm -f payara5-server || true
	docker run --init -m 8g --name payara5-server --rm -ti \
		-p 4848:4848 \
		-p 8080:8080 \
		-p 8181:8181 \
		-e ADMIN_USER=admin \
		-e DOMAIN_NAME=domain1 \
		payara5:local

#		-e AS_ADMIN_MASTERPASSWORD=asdfasdf \

build-ear:
	@cd ${PROJECT_DIR}/example && \
	mvn clean package --batch-mode && \
	cd ${PROJECT_DIR} && \
	mkdir -p ${PROJECT_DIR}/generated/ && \
	cp example/ear/target/example.ear ${PROJECT_DIR}/generated/

build:	build-ear generate-cert
	@cd ${PROJECT_DIR}
	docker build --tag payara5:local .

generate-cert:
	mkdir -p ${PROJECT_DIR}/generated/ && \
	if [ ! -f "${PROJECT_DIR}/generated/localhost.crt" ]; then \
		openssl req -x509 -out ${PROJECT_DIR}/generated/localhost.crt -keyout ${PROJECT_DIR}/generated/localhost.key -newkey rsa:2048 -nodes -sha256 \
			-subj '/CN=localhost' -extensions EXT -config <( \
			printf "[dn]\nCN=localhost\n[req]\ndistinguished_name = dn\n[EXT]\nsubjectAltName=DNS:localhost\nkeyUsage=digitalSignature\nextendedKeyUsage=serverAuth") && \
		openssl pkcs12 -export -name localhostServerCert -in ${PROJECT_DIR}/generated/localhost.crt -inkey ${PROJECT_DIR}/generated/localhost.key -out ${PROJECT_DIR}/generated/localhostP12Keystore.p12 -passout pass: ; \
	fi
	#keytool -importkeystore -destkeystore ${PROJECT_DIR}/generated/localhostKeystore.jks -srckeystore ${PROJECT_DIR}/generated/localhostP12Keystore.p12 -srcstoretype pkcs12 -alias localhostServerCert

