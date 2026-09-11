-- ============================================
-- Revenue Leakage Analysis: Olist E-Commerce
-- ============================================

-- Q1: Revenue and review impact of late vs on-time deliveries
SELECT
  CASE WHEN delivery_delay_days > 0 THEN 'Late' ELSE 'On-time' END AS delivery_status,
  COUNT(DISTINCT order_id) AS num_orders,
  AVG(review_score) AS avg_review_score,
  SUM(payment_value) AS total_revenue
FROM master_table
GROUP BY delivery_status;

-- Q2: Repeat purchase rate by review score
-- Note: repeat rate is relatively flat (6-8%) regardless of review score,
-- indicating low seller-loyalty behavior on this marketplace overall
WITH distinct_orders AS (
    SELECT DISTINCT order_id, customer_unique_id, review_score
    FROM master_table
),
order_counts AS (
    SELECT
        customer_unique_id,
        review_score,
        COUNT(order_id) OVER (PARTITION BY customer_unique_id) AS order_count
    FROM distinct_orders
)
SELECT
  review_score,
  COUNT(DISTINCT customer_unique_id) AS customers,
  SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) * 1.0 / COUNT(DISTINCT customer_unique_id) AS repeat_rate
FROM order_counts
GROUP BY review_score
ORDER BY review_score;

-- Q3: Top 10 product categories by revenue at risk from late deliveries
SELECT
  product_category_name_english,
  AVG(delivery_delay_days) AS avg_delay,
  AVG(review_score) AS avg_review,
  SUM(payment_value) AS revenue_at_risk,
  COUNT(DISTINCT order_id) AS num_orders
FROM master_table
WHERE delivery_delay_days > 0
GROUP BY product_category_name_english
HAVING COUNT(DISTINCT order_id) > 20
ORDER BY revenue_at_risk DESC
LIMIT 10;

-- Q4: Monthly revenue trend vs revenue tied to late orders
SELECT
  strftime('%Y-%m', order_purchase_timestamp) AS month,
  SUM(payment_value) AS total_revenue,
  SUM(CASE WHEN delivery_delay_days > 0 THEN payment_value ELSE 0 END) AS revenue_from_late_orders
FROM master_table
GROUP BY month
ORDER BY month;