docker-compose -f prom_grafana.yaml up
docker-compose -f postgres_exp.yaml up
#postgre sql container_name
docker exec -i f04feb3303ee psql -U ruslan -d demo < demo.sql
#http://192.168.19.128:3000/
#grafana id 9628
