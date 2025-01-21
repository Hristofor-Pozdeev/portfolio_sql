/*Запрос "Топ-3 аптеки. Вывести топ 3 аптеки по объему продаж (GROUP BY, LIMIT)
*/

SELECT 
  pharmacy_name, 
  SUM (price) AS sum_price 
from 
  pharma_orders 
group BY 
  pharmacy_name 
order by 
  sum_price DESC 
LIMIT 
  3