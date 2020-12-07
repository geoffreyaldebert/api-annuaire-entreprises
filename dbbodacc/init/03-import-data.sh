for d in `seq -w 2008 2020`; do
    psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY bodaccdata(originalfile,parution,dateParution,nojo,numeroannonce,data) FROM '/var/lib/postgresql/files/$d-RCS-A-data.csv' delimiter ',' CSV HEADER ENCODING 'UTF8';"
    psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY bodaccsiren(siren,nojo,numeroannonce,type) FROM '/var/lib/postgresql/files/$d-RCS-A-siren.csv' delimiter ',' CSV HEADER ENCODING 'UTF8';"

    psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY bodaccdata(originalfile,parution,dateParution,nojo,numeroannonce,data) FROM '/var/lib/postgresql/files/$d-RCS-B-data.csv' delimiter ',' CSV HEADER ENCODING 'UTF8';"
    psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY bodaccsiren(siren,nojo,numeroannonce,type) FROM '/var/lib/postgresql/files/$d-RCS-B-siren.csv' delimiter ',' CSV HEADER ENCODING 'UTF8';"

    psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY bodaccdata(originalfile,parution,dateParution,nojo,numeroannonce,data) FROM '/var/lib/postgresql/files/$d-BILAN-data.csv' delimiter ',' CSV HEADER ENCODING 'UTF8';"
    psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY bodaccsiren(siren,nojo,numeroannonce,type) FROM '/var/lib/postgresql/files/$d-BILAN-siren.csv' delimiter ',' CSV HEADER ENCODING 'UTF8';"

    psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY bodaccdata(originalfile,parution,dateParution,nojo,numeroannonce,data) FROM '/var/lib/postgresql/files/$d-PCL-data.csv' delimiter ',' CSV HEADER ENCODING 'UTF8';"
    psql -U $POSTGRES_USER -d $POSTGRES_DB -c "COPY bodaccsiren(siren,nojo,numeroannonce,type) FROM '/var/lib/postgresql/files/$d-PCL-siren.csv' delimiter ',' CSV HEADER ENCODING 'UTF8';"
done;

psql -U $POSTGRES_USER -d $POSTGRES_DB -c "DROP INDEX IF EXISTS bodaccdata_nojo;"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "CREATE INDEX bodaccdata_nojo ON bodaccdata (nojo);"

psql -U $POSTGRES_USER -d $POSTGRES_DB -c "DROP INDEX IF EXISTS bodaccsiren_nojo;"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "CREATE INDEX bodaccsiren_nojo ON bodaccsiren (nojo);"

psql -U $POSTGRES_USER -d $POSTGRES_DB -c "DROP INDEX IF EXISTS bodaccsiren_siren;"
psql -U $POSTGRES_USER -d $POSTGRES_DB -c "CREATE INDEX bodaccsiren_siren ON bodaccsiren (siren);"
