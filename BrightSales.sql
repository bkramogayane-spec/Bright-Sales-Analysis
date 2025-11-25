----All data 
SELECT*
FROM SALES.PRODUCT.DATA;
-----Metric calculation
-----Daily Price Per Unit
-----DAILY % GROSS PROFIT
SELECT
    DATE,
    SALES,
    COST_OF_SALES,
    QUANTITY_SOLD,
    SALES / NULLIF(QUANTITY_SOLD,0) AS UNIT_PRICE,
    COST_OF_SALES / NULLIF(QUANTITY_SOLD,0) AS UNIT_COST,
    (SALES - COST_OF_SALES) AS GrossProfit_AMOUNT,
    (SALES - COST_OF_SALES) / NULLIF(QUANTITY_SOLD,0) AS GrossProfit_PER_UNIT,
    (SALES - COST_OF_SALES) / NULLIF(SALES,0) AS GrossProfit_MARGIN_PCT
  FROM SALES.PRODUCT.DATA
  ORDER BY DATE;
  
----DAILY % GROSS PROFIT PER UNIT
SELECT 
    Date,
    Sales / Quantity_Sold AS Price_Per_Unit,
    Cost_Of_Sales / Quantity_Sold AS Cost_Per_Unit,
    ( (Sales / Quantity_Sold) - (Cost_Of_Sales / Quantity_Sold) )
        / (Sales / Quantity_Sold) AS Gross_Profit_Per_Unit_Pct
FROM SALES.PRODUCT.DATA;

-----AVERAGE UNIT SALES PRICE 
SELECT AVG(SALES / NULLIF(QUANTITY_SOLD,0)) AS AVG_UNIT_PRICE
FROM SALES.PRODUCT.DATA;

---Gross margin time series with 7‑day moving averages
SELECT
  DATE,
  (SALES - COST_OF_SALES) / NULLIF(SALES,0) AS GP_MARGIN_PCT,
  AVG((SALES - COST_OF_SALES) / NULLIF(SALES,0))
    OVER (ORDER BY DATE ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS GP_MARGIN_PCT_7D_MA
FROM SALES.PRODUCT.DATA
ORDER BY DATE;

SELECT
    DATE,
    SALES,
    COST_OF_SALES,
    QUANTITY_SOLD,
    SALES / NULLIF(QUANTITY_SOLD,0) AS UNIT_PRICE,
    COST_OF_SALES / NULLIF(QUANTITY_SOLD,0) AS UNIT_COST,
    (SALES - COST_OF_SALES) AS GrossProfit_AMOUNT,
    (SALES - COST_OF_SALES) / NULLIF(QUANTITY_SOLD,0) AS GrossProfit_PER_UNIT,
    (SALES - COST_OF_SALES) / NULLIF(SALES,0) AS GrossProfit_MARGIN_PCT
  FROM SALES.PRODUCT.DATA
  

WITH base AS (
    SELECT
        Date,
        Sales,
        Cost_Of_Sales,          -- include cost
        Quantity_Sold,
        Sales / NULLIF(Quantity_Sold, 0) AS Unit_Price,
        LAG(Sales / NULLIF(Quantity_Sold, 0)) OVER (ORDER BY Date) AS Prev_Price,
        LAG(Quantity_Sold) OVER (ORDER BY Date) AS Prev_Qty
    FROM SALES.PRODUCT.DATA
),
changes AS (
    SELECT
        Date,
        Sales,
        Cost_Of_Sales,
        Quantity_Sold,
        Unit_Price,
        (Quantity_Sold - Prev_Qty) / NULLIF(Prev_Qty, 0)   AS pct_qty_change,
        (Unit_Price    - Prev_Price) / NULLIF(Prev_Price, 0) AS pct_price_change
    FROM base
    WHERE Prev_Price IS NOT NULL
)
SELECT 
    TO_DATE(Date, 'DD/MM/YYYY') AS Date,
    DAYNAME(TO_DATE(Date, 'DD/MM/YYYY')) AS Day_Of_Week,
    MONTHNAME(TO_DATE(Date, 'DD/MM/YYYY')) AS Month_Name,
    YEAR(TO_DATE(Date, 'DD/MM/YYYY'))    AS Year,
    Sales                                                    AS SALES,
    Cost_Of_Sales                                            AS COST_OF_SALES,
    Quantity_Sold                                            AS QUANTITY_SOLD,
    Unit_Price                                               AS UNIT_PRICE,
    Cost_Of_Sales / NULLIF(Quantity_Sold, 0)                 AS UNIT_COST,
    (Sales - Cost_Of_Sales)                                  AS GrossProfit_AMOUNT,
    (Sales - Cost_Of_Sales) / NULLIF(Quantity_Sold, 0)       AS GrossProfit_PER_UNIT,
    (Sales - Cost_Of_Sales) / NULLIF(Sales, 0)               AS GrossProfit_MARGIN_PCT,
    pct_qty_change,
    pct_price_change,
    pct_qty_change / NULLIF(pct_price_change, 0)             AS Elasticity
FROM changes
ORDER BY Date;
