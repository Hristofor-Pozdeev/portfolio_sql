/*Запрос "Топ-3 лекарства". Вывести топ 3 лекарства по объему продаж
*/

SELECT 
  drug, 
  SUM (price) AS sum_price 
from 
  pharma_orders 
group BY 
  drug
order by 
  sum_price DESC 
LIMIT 
  3