USE supply_chain_db;

-- ------------------------------------------------------------
-- Query 1: Executive Delivery & SLA Performance Breakdown
-- Purpose: Evaluates overall fulfillment status distribution & actual vs scheduled days.
-- ------------------------------------------------------------
SELECT 
    `Delivery Status`,
    COUNT(*) AS total_orders,
    ROUND(AVG(`Days for shipping (real)`), 2) AS avg_actual_shipping_days,
    ROUND(AVG(`Days for shipment (scheduled)`), 2) AS avg_scheduled_shipping_days,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS status_percentage
FROM raw_supply_chain
GROUP BY `Delivery Status`
ORDER BY total_orders DESC;


-- ------------------------------------------------------------
-- Query 2: Fulfillment Bottlenecks by Shipping Mode & Market (CTE)
-- Purpose: Identifies high-risk market and shipping mode combinations driving SLA breaches.
-- ------------------------------------------------------------
WITH LogisticsSummary AS (
    SELECT 
        `Market`,
        `Shipping Mode`,
        COUNT(*) AS total_shipments,
        SUM(CASE WHEN `Delivery Status` = 'Late delivery' THEN 1 ELSE 0 END) AS late_shipments,
        SUM(`Benefit per order`) AS total_profit,
        SUM(`Sales`) AS total_sales
    FROM raw_supply_chain
    GROUP BY `Market`, `Shipping Mode`
)
SELECT 
    `Market`,
    `Shipping Mode`,
    total_shipments,
    late_shipments,
    ROUND((late_shipments * 100.0 / total_shipments), 2) AS late_delivery_rate_pct,
    ROUND(total_sales, 2) AS gross_sales,
    ROUND(total_profit, 2) AS total_profit
FROM LogisticsSummary
ORDER BY late_delivery_rate_pct DESC, gross_sales DESC;


-- ------------------------------------------------------------
-- Query 3: Regional Order Ranking & Delay Impact (Window Functions)
-- Purpose: Ranks order regions per market based on total volume of late deliveries.
-- ------------------------------------------------------------
SELECT 
    `Market`,
    `Order Region`,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN `Delivery Status` = 'Late delivery' THEN 1 ELSE 0 END) AS late_orders,
    ROUND(AVG(`Days for shipping (real)` - `Days for shipment (scheduled)`), 2) AS avg_delay_days,
    DENSE_RANK() OVER(
        PARTITION BY `Market` 
        ORDER BY SUM(CASE WHEN `Delivery Status` = 'Late delivery' THEN 1 ELSE 0 END) DESC
    ) AS region_delay_rank
FROM raw_supply_chain
GROUP BY `Market`, `Order Region`
ORDER BY `Market`, region_delay_rank;