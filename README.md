# Nigerian Food Prices, 2017 to 2021 (SQL Project)

## Question
Using the same National Bureau of Statistics (NBS) data as my [Excel project](https://github.com/kayode2407/nigeria-food-prices-excel), how did food prices change, which items and categories rose fastest, and how big are the price gaps between states?

## Data
Two tables in MySQL:
- `items`: 43 food items with category, plus the cheapest and most expensive state (Nov 2021)
- `prices`: 2,537 rows (43 items x 59 months, Jan 2017 to Nov 2021), joined to `items` by `item_id`

## What's in this repo
- `food_prices_queries.sql`: 10 queries, each with a comment
- `items.csv` and `food_prices_long.csv`: the data, reshaped from wide (months as columns) to long (one row per item per month)

## Key findings
- Average prices fell slightly in 2018 and 2019, then rose in 2020 and 2021. The 2021 average (723.17) is 13.6% above 2020 (636.85)
- Gari white rose the most between Jan 2020 and Nov 2021 (+89.4%), followed by yellow maize (+83.1%), white maize (+83.0%), yellow gari (+80.7%) and white beans (+77.4%)
- By category, beans (+74.5%), tubers (+65.3%) and oils (+65.0%) rose most; fish (+23.6%), dairy (+25.6%) and meat (+28.1%) rose least
- Nov 2021 had the highest average price of any month (796.91). The biggest monthly jump was Jul 2021 (+4.26%)
- Tomato has the widest gap between states: 5.6 times more expensive in Abia than in Bauchi

## Queries
| # | Question | SQL skills |
|---|---|---|
| 1 | Items per category | GROUP BY, COUNT |
| 2 | Average price per year | AVG, ROUND |
| 3 | Gari white price, Jan 2020 vs Nov 2021 | JOIN, LIKE, IN |
| 4 | Items above 1000 in Nov 2021 | JOIN, WHERE, ORDER BY |
| 5 | Top 10 price risers since Jan 2020 | Self-join, percentage change |
| 6 | Average rise by category | JOIN, GROUP BY, AVG |
| 7 | Months with the highest average price | GROUP BY, LIMIT |
| 8 | Fastest-rising item in each category | CTE, RANK() window function |
| 9 | Biggest month-on-month jumps | CTE, LAG() window function |
| 10 | Biggest price gaps between states | Ratio, ORDER BY |

## How to run it
1. Create a database called `food_prices` in MySQL 8 and create the `items` and `prices` tables
2. Import the two CSV files (MySQL Workbench: Table Data Import Wizard)
3. Run the queries in `food_prices_queries.sql`

## Data note
Two mudfish prices in Jul 2021 appear swapped in the source data (fresh jumps from 1087.71 to 1815.27 while dried drops from 1778.91 to 1144.76). I left them unchanged. This does not affect monthly averages but would affect item-level changes for that month.

## Tools
MySQL 8, MySQL Workbench
