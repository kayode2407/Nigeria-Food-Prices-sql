USE food_prices;

-- Q1: Number of items in each category
SELECT category, COUNT(*) AS items
FROM items
GROUP BY category
ORDER BY items DESC;

-- Q2: Average price in each year
SELECT year, ROUND(AVG(price), 2) AS avg_price
FROM prices
GROUP BY year
ORDER BY year;

-- Q3: Gari white price in Jan 2020 vs Nov 2021
SELECT i.item_name, p.month_start, p.price
FROM prices p
JOIN items i ON p.item_id = i.item_id
WHERE i.item_name LIKE 'Gari white%'
  AND p.month_start IN ('2020-01-01', '2021-11-01');
  
  -- Q4: Items priced above 1000 in Nov 2021
SELECT i.item_name, p.price
FROM prices p
JOIN items i ON p.item_id = i.item_id
WHERE p.month_start = '2021-11-01'
  AND p.price > 1000
ORDER BY p.price DESC;

-- Q5: Top 10 price risers, Jan 2020 to Nov 2021
SELECT i.item_name,
       ROUND((n.price / j.price - 1) * 100, 1) AS pct_change
FROM items i
JOIN prices j ON i.item_id = j.item_id AND j.month_start = '2020-01-01'
JOIN prices n ON i.item_id = n.item_id AND n.month_start = '2021-11-01'
ORDER BY pct_change DESC
LIMIT 10;

-- Q6: Average price rise by category, Jan 2020 to Nov 2021
SELECT i.category,
       ROUND(AVG((n.price / j.price - 1) * 100), 1) AS avg_pct_change
FROM items i
JOIN prices j ON i.item_id = j.item_id AND j.month_start = '2020-01-01'
JOIN prices n ON i.item_id = n.item_id AND n.month_start = '2021-11-01'
GROUP BY i.category
ORDER BY avg_pct_change DESC;

-- Q7: Three months with the highest average price
SELECT month_start, ROUND(AVG(price), 2) AS avg_price
FROM prices
GROUP BY month_start
ORDER BY avg_price DESC
LIMIT 3;