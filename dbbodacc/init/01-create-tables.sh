psql -U $POSTGRES_USER -d $POSTGRES_DB -c "CREATE EXTENSION pg_trgm;"

psql -U $POSTGRES_USER -d $POSTGRES_DB -c "DROP TABLE IF EXISTS bodaccdata;"

psql -U $POSTGRES_USER -d $POSTGRES_DB -c "DROP TABLE IF EXISTS bodaccsiren;"

psql -U $POSTGRES_USER -d $POSTGRES_DB -c "CREATE TABLE bodaccdata
(
	id_bodaccdata SERIAL PRIMARY KEY NOT NULL,
    originalfile CHARACTER VARYING,
    parution CHARACTER VARYING,
    dateparution CHARACTER VARYING,
    nojo CHARACTER VARYING,
    numeroannonce CHARACTER VARYING,
    data json NOT NULL
)
TABLESPACE pg_default;"

psql -U $POSTGRES_USER -d $POSTGRES_DB -c "CREATE TABLE bodaccsiren
(
	id_bodaccsiren SERIAL PRIMARY KEY NOT NULL,
    siren CHARACTER VARYING,
    nojo CHARACTER VARYING,
    numeroannonce CHARACTER VARYING,
    type CHARACTER VARYING
)
TABLESPACE pg_default;"