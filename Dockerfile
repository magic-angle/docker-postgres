FROM postgres:9.6

COPY postgresql.conf /postgresql.conf
COPY pg_hba.conf /pg_hba.conf
COPY init.sh /docker-entrypoint-initdb.d/init.sh

RUN chmod 777 /postgresql.conf
RUN chmod 777 /pg_hba.conf
RUN chmod a+r /docker-entrypoint-initdb.d/*