psql -U $POSTGRES_USER -d $POSTGRES_DB -c "
CREATE VIEW bodacc_view AS 
    SELECT 
       BS.siren,
       BS.nojo,
       BS.numeroannonce,
       BS.type,
       BD.dateparution,
       BD.parution,
       BD.originalfile,
       BD.data
    FROM bodaccsiren BS
    LEFT JOIN bodaccdata BD ON BS.nojo = BD.nojo AND BD.numeroannonce = BS.numeroannonce;"