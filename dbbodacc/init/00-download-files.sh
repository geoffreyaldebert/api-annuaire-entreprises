mkdir -p /var/lib/postgresql/files
for d in `seq -w 2008 2020`; do
  cd /var/lib/postgresql/files && wget https://files.data.gouv.fr/bodacc/$d-BILAN-data.csv.gz
  cd /var/lib/postgresql/files && wget https://files.data.gouv.fr/bodacc/$d-BILAN-siren.csv.gz
  cd /var/lib/postgresql/files && wget https://files.data.gouv.fr/bodacc/$d-RCS-A-data.csv.gz
  cd /var/lib/postgresql/files && wget https://files.data.gouv.fr/bodacc/$d-RCS-A-siren.csv.gz
  cd /var/lib/postgresql/files && wget https://files.data.gouv.fr/bodacc/$d-RCS-B-data.csv.gz
  cd /var/lib/postgresql/files && wget https://files.data.gouv.fr/bodacc/$d-RCS-B-siren.csv.gz
  cd /var/lib/postgresql/files && wget https://files.data.gouv.fr/bodacc/$d-PCL-data.csv.gz
  cd /var/lib/postgresql/files && wget https://files.data.gouv.fr/bodacc/$d-PCL-siren.csv.gz
  gunzip /var/lib/postgresql/files/$d-BILAN-data.csv.gz
  gunzip /var/lib/postgresql/files/$d-BILAN-siren.csv.gz
  gunzip /var/lib/postgresql/files/$d-RCS-A-data.csv.gz
  gunzip /var/lib/postgresql/files/$d-RCS-A-siren.csv.gz
  gunzip /var/lib/postgresql/files/$d-RCS-B-data.csv.gz
  gunzip /var/lib/postgresql/files/$d-RCS-B-siren.csv.gz
  gunzip /var/lib/postgresql/files/$d-PCL-data.csv.gz
  gunzip /var/lib/postgresql/files/$d-PCL-siren.csv.gz
done