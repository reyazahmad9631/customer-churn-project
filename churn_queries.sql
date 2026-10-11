SELECT Contract,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
       ROUND(100 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY Contract;
SELECT Churn,
       ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charge
FROM customers
GROUP BY Churn;
SELECT InternetService,
       COUNT(*) AS total_customers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
       ROUND(100 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY InternetService;
SELECT Contract, InternetService,
       COUNT(*) AS total_customers,
       ROUND(100 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_pct
FROM customers
GROUP BY Contract, InternetService
ORDER BY churn_rate_pct DESC;
SELECT Contract,
       COUNT(*) AS churned_customers,
       ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_lost
FROM customers
WHERE Churn = 'Yes'
GROUP BY Contract
ORDER BY monthly_revenue_lost DESC;