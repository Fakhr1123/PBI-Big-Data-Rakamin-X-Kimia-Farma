--Code Analisis Agregasi Dataset
SELECT 
  COUNT (*) AS total_transaksi,
  MIN (date) awal_history,
  MAX (date) akhir_history,
  AVG (price) rata_rata_harga,
  AVG (discount_percentage) rata_rata_discount,
  AVG (gross_profit_percentage) persentase_laba_rata_rata, 
  SUM (nett_sales) total_penjualan,
  ROUND(SUM (nett_profit)) total_profit, 
  AVG (rating_barnch) AS rata_rata_rating, 
  COUNT(DISTINCT customer_name) as total_pengunjung, 
  branch_name
FROM `kimia_farma.kf_analisa`
GROUP BY branch_name
ORDER BY total_penjualan DESC

--

SELECT 
  c.provinsi,
  COUNT(*) AS total_transaksi,
  MIN(date) AS awal_history,
  MAX(date) AS akhir_history,
  AVG(price) AS rata_rata_harga,
  AVG(discount_percentage) AS rata_rata_discount,
  AVG(gross_profit_percentage) AS persentase_laba_rata_rata, 
  SUM(nett_sales) AS total_penjualan,
  ROUND(SUM(nett_profit)) AS total_profit, 
  AVG(rating_barnch) AS rata_rata_rating, 
  COUNT(DISTINCT customer_name) AS total_pengunjung, 
  t.branch_name
FROM `kimia_farma.kf_analisa` t
JOIN `famous-buckeye-459514-m5.kimia_farma.kf_kantor_cabang` c ON t.branch_id = c.branch_id AND t.branch_name= c.branch_name
GROUP BY branch_name, c.provinsi
ORDER BY total_penjualan DESC;
