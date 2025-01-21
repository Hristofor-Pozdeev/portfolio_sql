/* Запрос "Накопленная сумма по клиентам"
    a. Соединить таблицы заказов и клиентов
    b. Соединить ФИО в одно поле
    c. Рассчитать накопленную сумму по каждому клиенту
*/
SELECT 
  pharma_orders.customer_id, 
  CONCAT(customers.first_name, ' ', customers.second_name,' ', customers.last_name) AS full_name,
  sum (pharma_orders.price) as sum_price 
from 
  customers 
  join pharma_orders on customers.customer_id = pharma_orders.customer_id 
GROUP by 
  pharma_orders.customer_id,
  customers.first_name, 
  customers.last_name, 
  customers.second_name 

