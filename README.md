### Fundamental SQL Using FUNCTION and GROUP BY
Source : https://academy.dqlab.id/main/package/practice/171?pf=0

----
#### Sample of Dataset Project
<details>
<summary markdown="span">tr_penjualan</summary>

| kode_transaksi | kode_pelanggan | no_urut | kode_produk | nama_produk               | qty  | total  |
|----------------|----------------|---------|-------------|---------------------------|------|--------|
| tr-001         | dqlabcust07    |       1 | prod-01     | Kotak Pensil DQLab        |    5 | 312500 |
| tr-001         | dqlabcust07    |       2 | prod-03     | Flash disk DQLab 32 GB    |    1 | 100000 |
| tr-001         | dqlabcust07    |       3 | prod-09     | Buku Planner Agenda DQLab |    3 | 276000 |
| tr-001         | dqlabcust07    |       4 | prod-04     | Flashdisk DQLab 32 GB     |    3 | 120000 |
| tr-002         | dqlabcust01    |       1 | prod-03     | Gift Voucher DQLab 100rb  |    2 | 200000 |

</details>

----

#### Proyek Pekerjaan - Analisis Penjualan Part 1

Aksara, saya senang dengan perkembanganmu belakangan ini. Saya mau minta tolong agar kamu melakukan analisis penjualan di suatu store. Adapun laporan yang diminta sebagai berikut:</br>
1. Total jumlah seluruh penjualan (total/revenue).</br>
2. Total quantity seluruh produk yang terjual.</br>
3. Total quantity dan total revenue untuk setiap kode produk.</br>
4. Rata - Rata total belanja per kode pelanggan.</br>
5. Selain itu,  jangan lupa untuk menambahkan kolom baru dengan nama ‘kategori’ yang mengkategorikan total/revenue ke dalam 3 kategori: High: > 300K; Medium: 100K - 300K; Low: <100K.

```sql
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

```

<details>
<summary markdown="span">OUTPUT 1:</summary>

| total   |
|---------|
| 3271600 |

</details>

<details>
<summary markdown="span">OUTPUT 2:</summary>

| qty  |
|------|
|   42 |

</details>

<details>
<summary markdown="span">OUTPUT 3:</summary>

| kode_produk | qty  | total   |
|-------------|------|---------|
| prod-01     |    6 |  375000 |
| prod-02     |    2 |  110000 |
| prod-03     |    3 |  300000 |
| prod-04     |    9 |  360000 |
| prod-05     |    4 | 1000000 |
| prod-07     |    1 |   48000 |
| prod-08     |    2 |   31600 |
| prod-09     |    6 |  552000 |
| prod-10     |    9 |  495000 |

</details>

<details>
<summary markdown="span">OUTPUT 4:</summary>

| kode_pelanggan | avg_total   |
|----------------|-------------|
| dqlabcust01    | 156000.0000 |
| dqlabcust02    | 515800.0000 |
| dqlabcust03    | 181666.6667 |
| dqlabcust05    | 139500.0000 |
| dqlabcust07    | 202125.0000 |

</details>

<details>
<summary markdown="span">OUTPUT 5:</summary>

| kode_transaksi | kode_pelanggan | no_urut | kode_produk | nama_produk                   | qty  | total   | kategori |
|----------------|----------------|---------|-------------|-------------------------------|------|---------|----------|
| tr-001         | dqlabcust07    |       1 | prod-01     | Kotak Pensil DQLab            |    5 |  312500 | High     |
| tr-001         | dqlabcust07    |       2 | prod-03     | Flash disk DQLab 32 GB        |    1 |  100000 | Medium   |
| tr-001         | dqlabcust07    |       3 | prod-09     | Buku Planner Agenda DQLab     |    3 |  276000 | Medium   |
| tr-001         | dqlabcust07    |       4 | prod-04     | Flashdisk DQLab 32 GB         |    3 |  120000 | Medium   |
| tr-002         | dqlabcust01    |       1 | prod-03     | Gift Voucher DQLab 100rb      |    2 |  200000 | Medium   |
| tr-002         | dqlabcust01    |       2 | prod-10     | Sticky Notes DQLab 500 sheets |    4 |  220000 | Medium   |
| tr-002         | dqlabcust01    |       3 | prod-07     | Tas Travel Organizer DQLab    |    1 |   48000 | Low      |
| tr-003         | dqlabcust03    |       1 | prod-02     | Flashdisk DQLab 64 GB         |    2 |  110000 | Medium   |
| tr-004         | dqlabcust03    |       1 | prod-10     | Sticky Notes DQLab 500 sheets |    5 |  275000 | Medium   |
| tr-004         | dqlabcust03    |       2 | prod-04     | Flashdisk DQLab 32 GB         |    4 |  160000 | Medium   |
| tr-005         | dqlabcust05    |       1 | prod-09     | Buku Planner Agenda DQLab     |    3 |  276000 | Medium   |
| tr-005         | dqlabcust05    |       2 | prod-01     | Kotak Pensil DQLab            |    1 |   62500 | Low      |
| tr-005         | dqlabcust05    |       3 | prod-04     | Flashdisk DQLab 32 GB         |    2 |   80000 | Low      |
| tr-006         | dqlabcust02    |       1 | prod-05     | Gift Voucher DQLab 250rb      |    4 | 1000000 | High     |
| tr-006         | dqlabcust02    |       2 | prod-08     | Gantungan Kunci DQLab         |    2 |   31600 | Low      |

</details>
