docker-compose -f prom_grafana.yaml up
docker-compose -f postgres_exp.yaml up
#postgre sql container_name
docker exec -i [container_postgre_id] psql -U ruslan -d demo < demo.sql
#http://192.168.19.128:3000/ - ип адрес хоста
#grafana id 9628
