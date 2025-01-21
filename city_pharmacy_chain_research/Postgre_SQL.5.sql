/* Запрос "Количество клиентов в аптеках"
    a. Соединить таблицы заказов и клиентов (JOIN)
    b. Посчитать кол-во уникальных клиентов на каждую аптеку (DISTINCT)
    c. Отсортировать аптеки по убыванию кол-ва клиентов (ORDER BY)
*/
SELECT 
  pharma_orders.pharmacy_name, 
  COUNT(
    DISTINCT pharma_orders.customer_id
  ) AS sum_customer_id 
FROM 
  customers 
  JOIN pharma_orders ON customers.customer_id = pharma_orders.customer_id 
GROUP BY 
  pharma_orders.pharmacy_name 
order BY 
  sum_customer_id DESC