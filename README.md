# Customer Segmentation K-Means
Aplikasi Customer Segmentation secara teknis dengan menggunakan Algoritma K-Means di R

Customer segmentation adalah proses penting yang diperlukan di bisnis untuk mengenal customer dengan lebih baik. Dengan demikian proses bisnis di marketing (pemasaran) dan CRM (customer relationship management) bisa dilakukan lebih tajam. Contoh: pesan marketing bisa lebih personal untuk setiap segment dengan biaya lebih optimal. Untuk menemukan segmentasi yang baik, perlu proses analisa data dari profile customer yang cukup banyak dan rutin. Ini bisa dibantu dengan algoritma komputer.

# Tahapan Customer Segmentation
1. Mempersiapkan data
2. Normalisasi data jika diperlukan
3. Menggunakan elbow method untuk menentukan jumlah cluster optimal
4. Melakukan penklasteran menggunakan metode K-Means
5. Melakukan identifikasi cluster menggunakan data baru

# Analisa Hasil Cluster Menggunakan K-Means
![image](https://user-images.githubusercontent.com/86001320/131073338-e3c2abf4-04f8-4b56-b3e3-77a6b13ae907.png)
Hasil cluster diatas dapat dibagi dalam lima bagian, dengan penjelasan sesuai nomor urut pada gambar sebagai berikut:
### 1. Ukuran / jumlah titik data pada tiap cluster
#### Dengan metode k-means dataset pelanggan yang terdiri dari 50 data terbagi menjadi 5 cluster. Cluster ke-1 memiliki 14 data, cluster ke-2 memiliki 5 data, dan seterusnya. 

### 2. Nilai rata-rata (centroid) dari tiap cluster
- Kolom pertama yang berisi angka 1 sampai dengan 5 adalah mewakili nomor cluster.
- Kolom Kelamin.1 menunjukkan nilai rata-rata dari data jenis kelamin, dengan angka 1 mewakili Pria dan angka 2 mewakili wanita.
- Kolom Umur, terlihat untuk cluster ke-1 umur rata-rata adalah 20 tahun, umur 61 tahun untuk cluster ke-2, dan seterusnya.
- dan seterusnya

### 3. Pembagian cluster dari tiap elemen data berdasarkan posisinya
Clustering vector ini adalah rangkaian vector yang berisi angka cluster. Dapat dilihat bahwa vector berisi angka 1 sampai dengan 5, maksimum sesuai dengan jumlah cluster yang diinginkan. Vector ini dimulai dari angka 2, yang artinya data pertama dari dataset dikategorikan sebagai cluster ke-2. Dari gambar juga terlihat isi vector kedua bernlai 1, ini artinya data kedua dari dataset dikategorikan sebagai cluster ke-1, dan seterusnya.

### 4. Jumlah jarak kuadrat dari setiap titik ke centroidnya
* Nilai 316.73367 adalah SS untuk cluster ke-1, 58.21123 adalah SS untuk cluste ke-2, dan seterusnya. Semakin kecil nilainya berpotensi semakin baik.
* total_SS: adalah SS untuk seluruh titik terhadap nilai rata-rata global, bukan untuk per cluster. Nilai ini selalu tetap dan tidak terpengaruh dengan jumlah cluster.
* between_SS: adalah total_SS dikurangi dengan jumlah nilai SS seluruh cluster.
* (between_SS / total_SS) adalah rasio antara between_SS dibagi dengan total_SS. Semakin besar persentasenya, ummnya semakin baik.

### 5. Komponen informasi lain yang terkandung di dalam objek kmeans
* cluster : Vector dari cluster untuk tiap titik data
* centers : informasi titik centroid dari setiap cluster
* totss : Total Sum of Squares (SS) untuk seluruh titik data
* withinss : Total Sum of Squares untuk setiap cluster
* tot.withins : Total penjumlahan dari setiap SS dati withinss
* betweenss : Perbedaan nilai antara totss dan tot.withinss
* size : Jumlah titik data pada setiap cluster
* iter : Jumlah iterasi luar yang digunakan oleh k-means
* ifault : Nilai integer yang menunjukkan indkator masalah pada algoritma

# Hasil Identifikasi Cluster Menggunakan Data Baru
![image](https://user-images.githubusercontent.com/86001320/131071516-daabccb0-0f7c-4e1b-90e3-7a9c786ec80a.png)

Berdasarkan hasil identifikasi diperoleh bahwa data tersebut termasuk dalam cluster ke 3 atau Gold Young Professional
