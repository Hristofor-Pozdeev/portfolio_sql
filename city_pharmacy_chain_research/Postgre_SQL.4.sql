/* Запрос "Накопленная сумма продаж по каждой аптеке" (OVER)
*/
SELECT 
  DISTINCT pharmacy_name, 
  sum (price) over (PARTITION by pharmacy_name) as sum_price 
FROM 
  pharma_orders
