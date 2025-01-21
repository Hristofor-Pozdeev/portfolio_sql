/*Запрос "Аптеки от 0.6 млн оборота". Вывести аптеки, имеющие более 0.6 млн оборота (HAVING)
*/
SELECT 
  pharmacy_name, 
  sum (price) AS sum_price 
from 
  pharma_orders 
group BY 
  pharmacy_name 
HAVING 
  SUM (price) > 600000 
ORDER BY 
  sum_price ASC