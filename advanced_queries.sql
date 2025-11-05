-- Total inventory value by warehouse
SELECT 
    w.name AS warehouse_name,
    COUNT(DISTINCT i.product_id) AS product_count,
    SUM(i.quantity * p.unit_price) AS total_inventory_value
FROM warehouses w
JOIN inventory i ON w.warehouse_id = i.warehouse_id
JOIN products p ON i.product_id = p.product_id
GROUP BY w.warehouse_id, w.name
ORDER BY total_inventory_value DESC;

-- 2. Suppliers with above-average order values (nested subquery)
SELECT 
    s.name,
    COUNT(o.order_id) AS total_orders,
    AVG(o.total_amount) AS avg_order_value
FROM suppliers s
JOIN orders o ON s.supplier_id = o.supplier_id
GROUP BY s.supplier_id, s.name
HAVING AVG(o.total_amount) > (
    SELECT AVG(total_amount) FROM orders
)
ORDER BY avg_order_value DESC;

-- 3. Products that have never been ordered (nested subquery)
SELECT product_id, name, category, unit_price
FROM products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id FROM order_details
);

-- 4. Monthly order statistics
SELECT 
    TO_CHAR(order_date, 'YYYY-MM') AS order_month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS monthly_revenue,
    AVG(total_amount) AS avg_order_value,
    MIN(total_amount) AS min_order,
    MAX(total_amount) AS max_order
FROM orders
GROUP BY TO_CHAR(order_date, 'YYYY-MM')
ORDER BY order_month DESC;

-- 5. Top 5 products by sales quantity (nested subquery with aggregation)
SELECT 
    p.name,
    p.category,
    (SELECT SUM(quantity) FROM order_details WHERE product_id = p.product_id) AS total_sold
FROM products p
WHERE p.product_id IN (SELECT product_id FROM order_details)
ORDER BY total_sold DESC
FETCH FIRST 5 ROWS ONLY;

-- 6. Warehouses with low utilization (having clause)
SELECT 
    w.name,
    w.capacity,
    COUNT(i.inventory_id) AS items_count,
    ROUND((COUNT(i.inventory_id) / w.capacity) * 100, 2) AS utilization_pct
FROM warehouses w
LEFT JOIN inventory i ON w.warehouse_id = i.warehouse_id
GROUP BY w.warehouse_id, w.name, w.capacity
HAVING COUNT(i.inventory_id) / w.capacity < 0.5
ORDER BY utilization_pct ASC;

-- 7. Categories with total inventory value exceeding threshold
SELECT 
    p.category,
    COUNT(DISTINCT p.product_id) AS product_count,
    SUM(i.quantity) AS total_quantity,
    SUM(i.quantity * p.unit_price) AS total_value
FROM products p
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.category
HAVING SUM(i.quantity * p.unit_price) > 10000
ORDER BY total_value DESC;

-- 8. Suppliers with delivery performance (complex join and aggregation)
SELECT 
    s.name AS supplier_name,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE WHEN o.status = 'DELIVERED' THEN 1 ELSE 0 END) AS delivered_orders,
    ROUND(SUM(CASE WHEN o.status = 'DELIVERED' THEN 1 ELSE 0 END) * 100.0 / COUNT(o.order_id), 2) AS delivery_rate,
    s.rating
FROM suppliers s
LEFT JOIN orders o ON s.supplier_id = o.supplier_id
GROUP BY s.supplier_id, s.name, s.rating
HAVING COUNT(o.order_id) > 0
ORDER BY delivery_rate DESC;

-- 9. Products with inventory across multiple warehouses (having clause)
SELECT 
    p.product_id,
    p.name,
    COUNT(DISTINCT i.warehouse_id) AS warehouse_count,
    SUM(i.quantity) AS total_quantity
FROM products p
JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.product_id, p.name
HAVING COUNT(DISTINCT i.warehouse_id) > 1
ORDER BY warehouse_count DESC;

-- 10. Orders with items count and total (correlated subquery)
SELECT 
    o.order_id,
    o.order_date,
    (SELECT COUNT(*) FROM order_details WHERE order_id = o.order_id) AS item_count,
    (SELECT SUM(subtotal) FROM order_details WHERE order_id = o.order_id) AS calculated_total,
    o.total_amount
FROM orders o
WHERE o.status != 'CANCELLED';

-- 11. Average inventory per category by warehouse
SELECT 
    p.category,
    w.name AS warehouse_name,
    COUNT(*) AS product_count,
    AVG(i.quantity) AS avg_quantity,
    SUM(i.quantity) AS total_quantity
FROM products p
JOIN inventory i ON p.product_id = i.product_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
GROUP BY p.category, w.warehouse_id, w.name
ORDER BY p.category, total_quantity DESC;

-- 12. Find customers' orders with above-average item count (nested aggregation)
SELECT order_id, order_date, status
FROM orders
WHERE order_id IN (
    SELECT order_id
    FROM order_details
    GROUP BY order_id
    HAVING COUNT(*) > (
        SELECT AVG(item_count)
        FROM (
            SELECT order_id, COUNT(*) AS item_count
            FROM order_details
            GROUP BY order_id
        )
    )
);

-- 13. Inventory turnover analysis
SELECT 
    p.name AS product_name,
    i.quantity AS current_stock,
    COALESCE((
        SELECT SUM(od.quantity)
        FROM order_details od
        WHERE od.product_id = p.product_id
    ), 0) AS total_ordered,
    CASE 
        WHEN i.quantity > 0 THEN 
            ROUND(COALESCE((
                SELECT SUM(od.quantity)
                FROM order_details od
                WHERE od.product_id = p.product_id
            ), 0) / i.quantity, 2)
        ELSE 0
    END AS turnover_ratio
FROM products p
JOIN inventory i ON p.product_id = i.product_id
WHERE i.warehouse_id = 1
ORDER BY turnover_ratio DESC;

-- 14. Supplier ranking by total business value
SELECT 
    RANK() OVER (ORDER BY SUM(o.total_amount) DESC) AS rank,
    s.name,
    COUNT(o.order_id) AS order_count,
    SUM(o.total_amount) AS total_value,
    s.rating
FROM suppliers s
LEFT JOIN orders o ON s.supplier_id = o.supplier_id
GROUP BY s.supplier_id, s.name, s.rating
ORDER BY rank;

-- 15. Products needing reorder with supplier information (complex view query)
SELECT 
    p.name AS product_name,
    s.name AS supplier_name,
    s.email AS supplier_email,
    w.name AS warehouse_name,
    i.quantity AS current_stock,
    i.reorder_level,
    (i.reorder_level - i.quantity) AS shortage,
    (i.reorder_level - i.quantity) * p.unit_price AS reorder_value
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN suppliers s ON p.supplier_id = s.supplier_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
WHERE i.quantity < i.reorder_level
ORDER BY shortage DESC;
