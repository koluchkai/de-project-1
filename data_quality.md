# 1.3. Качество данных

Для построения витрины нам подадобятся 2 таблицы: 
+ `production.orders`
+ `production.orderstatuses`

## Оценка качества данных, хранящихся в источнике.

Поле `order_id` является первичным ключом в таблице, поэтому он уникален. 

В таблице `orders` представлено 10 000 заказов. 

В необходимых нам полях пропусков нет. Значений, равных 0 в поле `payment` нет. 

Проблем с типом данных нет. 

## Инструменты обеспечивают качество данных в источнике.

Пример ответа:

| Таблицы             | Объект                            | Инструмент      | Для чего используется |
| ------------------- | --------------------------------- | --------------- | --------------------- |
| production.orders           | order_id int NOT NULL PRIMARY KEY                      | PRIMARY KEY     | Обеспечивает уникальность записей о пользователях |
| production.orders           | ((cost = (payment + bonus_payment)))                   | CHECK           | стоимость должна сумировать из платжей и бонусных платежей  |
| production.ordersitems      | (((discount >= (0)::numeric) AND (discount <= price))) | CHECK           | дискаунт больше 0 и дискаунт меньше цены  |
| production.ordersitems      | id int NOT NULL PRIMARY KEY                    | PRIMARY KEY           | Обеспечивает уникальность записей о пользователях |
| production.ordersitems      | ((price >= (0)::numeric))                  | CHECK           | стоимость должна быть больше 0  |
| production.ordersitems      | ((quantity > 0))                  | CHECK           | количество должно быть строго больше 0  |
| production.ordersitems      | order_id и product_id                   | UNIQUE           | обеспечивает уникальность содержимого полей  |
| production.users            | id int NOT NULL PRIMARY KEY                            | PRIMARY KEY     | Обеспечивает уникальность записей о пользователях |
| production.orderstatuses    | id int NOT NULL PRIMARY KEY                            | PRIMARY KEY     | Обеспечивает уникальность записей о пользователях |
| production.orderstatuslog    | id int NOT NULL PRIMARY KEY                            | PRIMARY KEY     | Обеспечивает уникальность записей о пользователях |
| production.orderstatuslog      | order_id и status_id                   | UNIQUE           | обеспечивает уникальность содержимого полей  |
| production.products    | id int NOT NULL PRIMARY KEY                            | PRIMARY KEY     | Обеспечивает уникальность записей о пользователях |
| production.products      | ((price >= (0)::numeric))                  | CHECK           | стоимость должна быть больше 0  |