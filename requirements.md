# 1.2. Структура исходных данных

Для расчета витрины нужны будут: 
+ таблица `production.orders`, поля `user_id`, `order_ts`, `order_id`, `payment`
+ таблица `production.orderstatuses` - поля `id` и `key`, чтобы отфильтровать заказы со статусом Closed