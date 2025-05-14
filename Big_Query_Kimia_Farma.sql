--Code Big Query Analisis
CREATE OR REPLACE TABLE `famous-buckeye-459514-m5.kimia_farma.kf_analisis` AS 
SELECT 
  t.transaction_id, 
  t.date, 
  t.branch_id,
  c.branch_name,
  c.kota,  
  c.provinsi,
  t.rating as rating_transaksi,
  t.customer_name,
  t.product_id,
  p.product_name,
  t.price,
  t.discount_percentage,
  CASE 
    WHEN t.price <= 50000 THEN 0.1
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.2
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    ELSE 0.3
  END AS gross_profit_percentage,
  (t.price*(1-(t.discount_percentage))) as nett_sales,
  (t.price*(1-(t.discount_percentage))*
  CASE 
    WHEN t.price <= 50000 THEN 0.1
    WHEN t.price > 50000 AND t.price <= 100000 THEN 0.15
    WHEN t.price > 100000 AND t.price <= 300000 THEN 0.2
    WHEN t.price > 300000 AND t.price <= 500000 THEN 0.25
    ELSE 0.3
  END) nett_profit,
  c.rating as rating_barnch
FROM `famous-buckeye-459514-m5.kimia_farma.kf_final_transaction` t 
JOIN `famous-buckeye-459514-m5.kimia_farma.kf_kantor_cabang` c ON t.branch_id = c.branch_id
JOIN `famous-buckeye-459514-m5.kimia_farma.kf_product` p ON t.product_id = p.product_id;


