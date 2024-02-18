FROM payara/server-full:5.2022.5

COPY generated/example.ear ${DEPLOY_DIR}/

#RUN echo 'create-jdbc-connection-pool --datasourceclassname org.postgresql.ds.PGConnectionPoolDataSource --restype javax.sql.ConnectionPoolDataSource --property user=postgres:password=password:DatabaseName=fin_dev:ServerName=${ENV=HOST_IP}:port=5432 fing-pool'  > $POSTBOOT_COMMANDS
