PROJECT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

run:	build
	@cd ${PROJECT_DIR}
	docker run --init -m 8g --name payara5-server --rm -ti \
		-p 4848:4848 -p 8080:8080 -p 8181:8181 \
		-e PAYARA_ADMIN_PASSWORD=asdfasdf \
		payara5:local

build-ear:
	@cd ${PROJECT_DIR}/example && \
	mvn clean package --batch-mode && \
	cd ${PROJECT_DIR} && \
	mkdir -p ${PROJECT_DIR}/generated/ && \
	cp example/ear/target/example.ear ${PROJECT_DIR}/generated/

build:	build-ear
	@cd ${PROJECT_DIR}
	docker build --tag payara5:local .

