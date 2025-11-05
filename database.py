import oracledb
from datetime import datetime

class Database:
    def __init__(self, username, password, dsn):
        self.username = username
        self.password = password
        self.dsn = dsn
        self.connection = None
        
    def connect(self):
        try:
            print(f"Attempting to connect to Oracle: {self.username}@{self.dsn}")
            self.connection = oracledb.connect(
                user=self.username,
                password=self.password,
                dsn=self.dsn
            )
            print("✓ Database connection successful!")
            return True
        except oracledb.Error as error:
            print(f"✗ Database connection error: {error}")
            print(f"  User: {self.username}")
            print(f"  DSN: {self.dsn}")
            print(f"  Make sure Oracle service is running and credentials are correct")
            return False
        except Exception as e:
            print(f"✗ Unexpected error: {e}")
            return False
    
    def disconnect(self):
        if self.connection:
            self.connection.close()
    
    def execute_query(self, query, params=None):
        if not self.connection:
            print("No database connection available")
            return None
        cursor = self.connection.cursor()
        try:
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)
            return cursor.fetchall()
        except oracledb.Error as error:
            print(f"Query error: {error}")
            return None
        finally:
            cursor.close()
    
    def execute_update(self, query, params=None):
        if not self.connection:
            print("No database connection available")
            return False
        cursor = self.connection.cursor()
        try:
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)
            self.connection.commit()
            return True
        except oracledb.Error as error:
            self.connection.rollback()
            print(f"Update error: {error}")
            return False
        finally:
            cursor.close()

    def get_all_suppliers(self):
        query = "SELECT * FROM suppliers ORDER BY supplier_id"
        return self.execute_query(query)
    
    def add_supplier(self, name, contact, email, phone, address, city, country, rating):
        query = """
        INSERT INTO suppliers (supplier_id, name, contact_person, email, phone, address, city, country, rating)
        VALUES (supplier_seq.NEXTVAL, :1, :2, :3, :4, :5, :6, :7, :8)
        """
        return self.execute_update(query, (name, contact, email, phone, address, city, country, rating))
    
    def update_supplier(self, supplier_id, name, contact, email, phone, address, city, country, rating):
        query = """
        UPDATE suppliers 
        SET name=:1, contact_person=:2, email=:3, phone=:4, address=:5, city=:6, country=:7, rating=:8
        WHERE supplier_id=:9
        """
        return self.execute_update(query, (name, contact, email, phone, address, city, country, rating, supplier_id))
    
    def delete_supplier(self, supplier_id):
        query = "DELETE FROM suppliers WHERE supplier_id = :1"
        return self.execute_update(query, (supplier_id,))

    def get_all_products(self):
        # Query for the correct schema from schema.sql
        query = """
        SELECT p.product_id, p.name, p.category, p.unit_price, p.description, s.name as supplier_name
        FROM products p
        LEFT JOIN suppliers s ON p.supplier_id = s.supplier_id
        ORDER BY p.product_id
        """
        return self.execute_query(query)
    
    def add_product(self, name, category, supplier_id, price, description):
        # Use correct schema columns: name, category, supplier_id, unit_price, description
        query = """
        INSERT INTO products (product_id, name, category, supplier_id, unit_price, description)
        VALUES (product_seq.NEXTVAL, :1, :2, :3, :4, :5)
        """
        return self.execute_update(query, (name, category, supplier_id, price, description))
    
    def update_product(self, product_id, name, category, supplier_id, price, description):
        query = """
        UPDATE products 
        SET name=:1, category=:2, supplier_id=:3, unit_price=:4, description=:5
        WHERE product_id=:6
        """
        return self.execute_update(query, (name, category, supplier_id, price, description, product_id))
    
    def delete_product(self, product_id):
        query = "DELETE FROM products WHERE product_id = :1"
        return self.execute_update(query, (product_id,))

    def get_all_warehouses(self):
        query = "SELECT * FROM warehouses ORDER BY warehouse_id"
        return self.execute_query(query)
    
    def add_warehouse(self, name, location, city, capacity, manager, phone):
        query = """
        INSERT INTO warehouses (warehouse_id, name, location, city, capacity, manager, phone)
        VALUES (warehouse_seq.NEXTVAL, :1, :2, :3, :4, :5, :6)
        """
        return self.execute_update(query, (name, location, city, capacity, manager, phone))

    def get_inventory_status(self):
        query = """
        SELECT i.inventory_id, p.name as product_name, w.name as warehouse_name, 
               i.quantity, i.reorder_level, i.last_updated
        FROM inventory i
        JOIN products p ON i.product_id = p.product_id
        JOIN warehouses w ON i.warehouse_id = w.warehouse_id
        ORDER BY i.inventory_id
        """
        return self.execute_query(query)
    
    def get_low_stock(self):
        query = "SELECT * FROM low_stock_items"
        return self.execute_query(query)
    
    def update_inventory(self, inventory_id, quantity):
        query = """
        UPDATE inventory 
        SET quantity = :1, last_updated = SYSDATE
        WHERE inventory_id = :2
        """
        return self.execute_update(query, (quantity, inventory_id))

    def get_all_orders(self):
        query = "SELECT * FROM order_summary ORDER BY order_id DESC"
        return self.execute_query(query)
    
    def create_order(self, supplier_id, warehouse_id, delivery_date):
        cursor = self.connection.cursor()
        try:
            order_id = cursor.var(int)
            query = """
            INSERT INTO orders (order_id, supplier_id, warehouse_id, delivery_date)
            VALUES (order_seq.NEXTVAL, :1, :2, TO_DATE(:3, 'YYYY-MM-DD'))
            RETURNING order_id INTO :4
            """
            cursor.execute(query, (supplier_id, warehouse_id, delivery_date, order_id))
            self.connection.commit()
            return order_id.getvalue()[0]
        except oracledb.Error as error:
            self.connection.rollback()
            print(f"Create order error: {error}")
            return None
        finally:
            cursor.close()
    
    def add_order_detail(self, order_id, product_id, quantity, unit_price):
        subtotal = quantity * unit_price
        query = """
        INSERT INTO order_details (detail_id, order_id, product_id, quantity, unit_price, subtotal)
        VALUES (detail_seq.NEXTVAL, :1, :2, :3, :4, :5)
        """
        return self.execute_update(query, (order_id, product_id, quantity, unit_price, subtotal))
    
    def update_order_status(self, order_id, status):
        query = "UPDATE orders SET status = :1 WHERE order_id = :2"
        return self.execute_update(query, (status, order_id))
    
    def get_order_details(self, order_id):
        query = """
        SELECT od.detail_id, p.name, od.quantity, od.unit_price, od.subtotal
        FROM order_details od
        JOIN products p ON od.product_id = p.product_id
        WHERE od.order_id = :1
        """
        return self.execute_query(query, (order_id,))

    def get_inventory_by_category(self):
        query = """
        SELECT p.category, COUNT(*) as product_count, SUM(i.quantity) as total_quantity
        FROM products p
        JOIN inventory i ON p.product_id = i.product_id
        GROUP BY p.category
        ORDER BY total_quantity DESC
        """
        return self.execute_query(query)
    
    def get_top_suppliers(self):
        query = """
        SELECT s.name, COUNT(o.order_id) as order_count, 
               NVL(SUM(o.total_amount), 0) as total_value, s.rating
        FROM suppliers s
        LEFT JOIN orders o ON s.supplier_id = o.supplier_id
        GROUP BY s.supplier_id, s.name, s.rating
        HAVING COUNT(o.order_id) > 0
        ORDER BY total_value DESC
        FETCH FIRST 10 ROWS ONLY
        """
        return self.execute_query(query)
    
    def get_warehouse_utilization(self):
        query = """
        SELECT w.name, w.capacity, 
               (SELECT COUNT(*) FROM inventory WHERE warehouse_id = w.warehouse_id) as items_stored,
               ROUND((SELECT COUNT(*) FROM inventory WHERE warehouse_id = w.warehouse_id) / w.capacity * 100, 2) as utilization_pct
        FROM warehouses w
        ORDER BY utilization_pct DESC
        FETCH FIRST 10 ROWS ONLY
        """
        return self.execute_query(query)
    
    def get_orders_by_status(self):
        query = """
        SELECT status, COUNT(*) as order_count, SUM(total_amount) as total_value
        FROM orders
        GROUP BY status
        ORDER BY order_count DESC
        """
        return self.execute_query(query)
    
    def get_products_needing_reorder(self):
        query = """
        SELECT p.name, w.name as warehouse, i.quantity, i.reorder_level,
               (i.reorder_level - i.quantity) as shortage
        FROM inventory i
        JOIN products p ON i.product_id = p.product_id
        JOIN warehouses w ON i.warehouse_id = w.warehouse_id
        WHERE i.quantity < i.reorder_level
        ORDER BY shortage DESC
        """
        return self.execute_query(query)
    
    def get_analytics_summary(self):
        """Get summary KPIs for analytics dashboard"""
        query = """
        SELECT 
            (SELECT COUNT(*) FROM products) as total_products,
            (SELECT COUNT(*) FROM suppliers) as total_suppliers,
            (SELECT COUNT(*) FROM warehouses) as total_warehouses,
            (SELECT COUNT(*) FROM orders) as total_orders,
            (SELECT NVL(SUM(total_amount), 0) FROM orders) as total_order_value,
            (SELECT COUNT(*) FROM orders WHERE status = 'PENDING') as pending_orders,
            (SELECT COUNT(*) FROM inventory WHERE quantity < reorder_level) as low_stock_items,
            (SELECT NVL(SUM(i.quantity * p.unit_price), 0) 
             FROM inventory i JOIN products p ON i.product_id = p.product_id) as total_inventory_value
        FROM dual
        """
        result = self.execute_query(query)
        return result[0] if result else None
    
    def get_recent_orders(self, limit=10):
        """Get recent orders for analytics"""
        query = """
        SELECT o.order_id, s.name as supplier_name, o.order_date, 
               o.status, o.total_amount
        FROM orders o
        JOIN suppliers s ON o.supplier_id = s.supplier_id
        ORDER BY o.order_date DESC
        FETCH FIRST :limit ROWS ONLY
        """
        return self.execute_query(query, {'limit': limit})
    
    def get_revenue_by_month(self, months=6):
        """Get revenue by month for trend analysis"""
        query = """
        SELECT TO_CHAR(order_date, 'Mon YYYY') as month,
               COUNT(*) as order_count,
               NVL(SUM(total_amount), 0) as revenue
        FROM orders
        WHERE order_date >= ADD_MONTHS(SYSDATE, -:months)
        GROUP BY TO_CHAR(order_date, 'Mon YYYY'), TO_CHAR(order_date, 'YYYYMM')
        ORDER BY TO_CHAR(order_date, 'YYYYMM') DESC
        """
        return self.execute_query(query, {'months': months})
    
    def get_top_products_by_value(self, limit=10):
        """Get top products by inventory value"""
        query = """
        SELECT p.name, p.category, 
               SUM(i.quantity) as total_quantity,
               p.unit_price,
               SUM(i.quantity * p.unit_price) as total_value
        FROM products p
        JOIN inventory i ON p.product_id = i.product_id
        GROUP BY p.product_id, p.name, p.category, p.unit_price
        ORDER BY total_value DESC
        FETCH FIRST :limit ROWS ONLY
        """
        return self.execute_query(query, {'limit': limit})

