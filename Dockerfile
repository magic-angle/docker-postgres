FROM postgres:9.6

# Install WAL-E and dependencies for PITR backups
RUN apt-get update && apt-get install -y python3-pip python3.4 lzop pv daemontools && \
   pip3 install wal-e[aws] && \
   apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


COPY postgresql.conf /postgresql.conf
COPY pg_hba.conf /pg_hba.conf
COPY init.sh /docker-entrypoint-initdb.d/init.sh

RUN chmod 777 /postgresql.conf
RUN chmod 777 /pg_hba.conf
RUN chmod a+r /docker-entrypoint-initdb.d/*