FROM postgres:13.3-alpine3.14

COPY ./schemas/1_schema_v1.0.sql /docker-entrypoint-initdb.d
COPY ./schemas/2_schema_v1.1.sql /docker-entrypoint-initdb.d
COPY ./schemas/3_schema_v1.2.sql /docker-entrypoint-initdb.d
COPY ./schemas/4_schema_v1.3.sql /docker-entrypoint-initdb.d
COPY ./schemas/5_schema_v1.4.sql /docker-entrypoint-initdb.d
COPY ./schemas/6_schema_v1.5.sql /docker-entrypoint-initdb.d
COPY ./schemas/7_schema_v1.6.sql /docker-entrypoint-initdb.d
COPY ./schemas/8_schema_v1.7.sql /docker-entrypoint-initdb.d
COPY ./schemas/9_schema_v1.8.sql /docker-entrypoint-initdb.d

RUN chmod a+r /docker-entrypoint-initdb.d/*