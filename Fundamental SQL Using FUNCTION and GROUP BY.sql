## 1. Total jumlah seluruh penjualan (total/revenue).
SELECT 
  sum(total) as total 
FROM 
  tr_penjualan;
  
## 2. Total quantity seluruh produk yang terjual.
SELECT 
  sum(qty) as qty 
FROM 
  tr_penjualan;
  
## 3. Total quantity dan total revenue untuk setiap kode produk.
SELECT 
  kode_produk, 
  sum(qty) as qty, 
  sum(total) as total 
FROM 
  tr_penjualan
GROUP BY 
  kode_produk;
  
## 4. Rata - Rata total belanja per kode pelanggan.
SELECT 
  kode_pelanggan, 
  avg(total) as avg_total 
FROM 
  tr_penjualan
GROUP BY 
  kode_pelanggan;

## 5. Selain itu,  jangan lupa untuk menambahkan kolom baru dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K.
SELECT 
  kode_transaksi,
  kode_pelanggan,
  no_urut,
  kode_produk, 
  nama_produk, 
  qty, 
  total,
CASE  
    WHEN total > 300000 THEN 'High'
    WHEN total < 100000 THEN 'Low'  
    ELSE 'Medium'  
END as kategori
FROM 
  tr_penjualan;