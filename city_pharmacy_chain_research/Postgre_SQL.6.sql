/*  Запрос "Лучшие клиенты"
    a. Соединить таблицы заказов и клиентов (JOIN)
    b. Посчитать тотал сумму заказов для каждого клиента
    c. Проранжировать клиентов по убыванию суммы заказа
    d. Оставить топ-10 клиентов
*/
SELECT 
  pharma_orders.customer_id, 
  pharma_orders.price, 
  customers.first_name, 
  customers.last_name, 
  customers.second_name, 
  sum (pharma_orders.price) as sum_price 
from 
  customers 
  join pharma_orders on customers.customer_id = pharma_orders.customer_id 
GROUP by 
  pharma_orders.customer_id, 
  pharma_orders.price, 
  customers.first_name, 
  customers.last_name, 
  customers.second_name 
order BY 
  pharma_orders.price DESC 
LIMIT 
  10


