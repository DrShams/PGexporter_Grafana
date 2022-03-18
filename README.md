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

> `docker exec -i postgres psql -U ruslan -d demo -c 'SELECT * FROM "flights_v" WHERE "flight_id" > '0' AND "departure_city" IS NOT NULL' `

#5 Можно протестировать базу данных внутри следующим скриптом .sh
```
for i in {1..999};
do
    docker exec -i 01ea55ff0236 psql -U ruslan -d demo -c 'SELECT * FROM "flights_v" WHERE "flight_id" > '0' AND "departure_city" IS NOT NULL'
done
```

#6 Настройка JMeter

> JDBC -> DatabaseURL -> jdbc:postgresql://192.168.19.128:5430/demo

> Базовые запросы для теста
```
INSERT INTO "aircrafts_data" ("aircraft_code", "model", "range") VALUES ('CR6',	'{"en": "Bombardier CRJ-200", "ru": "Ruslan CRJ-200"}', 9700);

DELETE FROM "aircrafts_data" WHERE (("aircraft_code" = 'CR6'));

SELECT "airport_code", "airport_name", "city" FROM "airports" GROUP BY "airport_name", "airport_code", "city" HAVING "airport_name" LIKE 'Vlad%' ORDER BY "airport_name"

UPDATE "aircrafts_data" SET "aircraft_code" = 'CR4', "model" = '{"en": "Bombardier CRJ-200", "ru": "Бомбардье CRJ-200"}', "range" = '2700' WHERE "aircraft_code" = 'CR4';
```
