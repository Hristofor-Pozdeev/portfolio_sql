/*Запрос "Самые частые клиенты аптек Горздрав и Здравсити"
    a Сделать две временные таблицы: для аптеки горздрав и здравсити (WITH)
    b. Внутри каждой соединить таблицы заказов и клиентов (JOIN)
    c. Внутри каждой привести данные в формат "клиент - кол-во заказов в аптеке"
    d. Внутри каждой оставить топ 10 клиентов каждой аптеки
    e. Объединить клиентов с помощью UNION
*/
WITH gorzdrav_customers AS (
  SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    COUNT(o.order_id) AS order_count 
  FROM 
    pharma_orders o 
    JOIN customers c ON o.customer_id = c.customer_id 
  WHERE 
    o.pharmacy_name = 'Горздрав' 
  GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name 
  ORDER BY 
    order_count DESC 
  LIMIT 
    10
), zdravcity_customers AS (
  SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    COUNT(o.order_id) AS order_count 
  FROM 
    pharma_orders o 
    JOIN customers c ON o.customer_id = c.customer_id 
  WHERE 
    o.pharmacy_name = 'Здравсити' 
  GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name 
  ORDER BY 
    order_count DESC 
  LIMIT 
    10
) 
SELECT 
  'Горздрав' AS pharmacy, 
  c.first_name, 
  c.last_name, 
  gc.order_count 
FROM 
  gorzdrav_customers gc 
  JOIN customers c ON gc.customer_id = c.customer_id 
UNION ALL 
SELECT 
  'Здравсити' AS pharmacy, 
  c.first_name, 
  c.last_name, 
  zc.order_count 
FROM 
  zdravcity_customers zc 
  JOIN customers c ON zc.customer_id = c.customer_id
