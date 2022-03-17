![img](images/scheme.png)

#1 Собрать контейнеры из compose файлов

> `docker-compose -f prom_grafana.yaml up`
> `docker-compose -f postgres_exp.yaml up`

#2 Импорт демо базы данных в POSTGRES

> `docker exec -i [container_name] psql -U ruslan -d demo < demo.sql`
> `docker exec -i postgres psql -U ruslan -d demo < demo.sql`

http://192.168.19.128 - ип адрес хоста Linux Ubuntu

#3 Grafana
- Import dashboard grafana id 9628
- Data Source указать http://192.168.19.128:9090 - Порт Prometheus


#4 Образец выполнения селект запроса с бд

> `docker exec -i postgres psql -U ruslan -d demo -c 'SELECT * FROM "flights_v" WHERE "flight_id" > '0' AND "departure_city" IS NOT NULL'`

#5 Можно протестировать базу данных внутри следующим скриптом .sh
```
for i in {1..999};
do
    docker exec -i 01ea55ff0236 psql -U ruslan -d demo -c 'SELECT * FROM "flights_v" WHERE "flight_id" > '0' AND "departure_city" IS NOT NULL'
done
```
