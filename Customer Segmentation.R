#Mempersiapkan data
pelanggan <- read.csv("https://academy.dqlab.id/dataset/customer_segments.txt", sep="\t")
pelanggan_matrix <- data.matrix(pelanggan[c("Jenis.Kelamin", "Profesi", "Tipe.Residen")])
pelanggan <- data.frame(pelanggan, pelanggan_matrix)
Profesi <- unique(pelanggan[c("Profesi","Profesi.1")])
Jenis.Kelamin <- unique(pelanggan[c("Jenis.Kelamin","Jenis.Kelamin.1")])
Tipe.Residen <- unique(pelanggan[c("Tipe.Residen","Tipe.Residen.1")])

#Normalisasi nilai belanja setahun
pelanggan$NilaiBelanjaSetahun <- pelanggan$NilaiBelanjaSetahun/1000000

#Field yang akan digunakan
field_yang_digunakan = c("Jenis.Kelamin.1", "Umur", "Profesi.1", "Tipe.Residen.1","NilaiBelanjaSetahun")

#Menentukan jumlah cluster terbaik
sse <- sapply(1:10,
              function(param_k)
              {
                kmeans(pelanggan[field_yang_digunakan], param_k, nstart=25)$tot.withinss
              }
)
sse

library(ggplot2)
jumlah_cluster_max <- 10
ssdata = data.frame(cluster=c(1:jumlah_cluster_max),sse)
ggplot(ssdata, aes(x=cluster,y=sse)) +
  geom_line(color="red") + geom_point() +
  ylab("Within Cluster Sum of Squares") + xlab("Jumlah Cluster") +
  geom_text(aes(label=format(round(sse, 2), nsmall = 2)),hjust=-0.2, vjust=-0.5) +
  scale_x_discrete(limits=c(1:jumlah_cluster_max))

#Bagian K-Means
set.seed(100)

#Fungsi kmeans untuk membentuk 5 cluster dengan 25 skenario random
segmentasi <- kmeans(x=pelanggan[field_yang_digunakan],centers=5,nstart=25)
segmentasi

#Penggabungan hasil cluster
segmentasi$cluster
pelanggan$cluster <- segmentasi$cluster
str(pelanggan)

#Analisa hasil
#Melihat data cluster ke 1-5
pelanggan[which(pelanggan$cluster == 1),]
pelanggan[which(pelanggan$cluster == 2),]
pelanggan[which(pelanggan$cluster == 3),]
pelanggan[which(pelanggan$cluster == 4),]
pelanggan[which(pelanggan$cluster == 5),]

#Memberikan nama pada setiap cluster
Segmen.Pelanggan <- data.frame(cluster=c(1,2,3,4,5), 
                               Nama.Segmen=c("Silver Youth Gals", "Diamond Senior Member",
                                             "Gold Young Professional", "Diamond Professional",
                                             "Silver Mid Professional"))

#Menggabungkan seluruh aset ke dalam variable Identitas.Cluster
Identitas.Cluster <- list(Profesi=Profesi, Jenis.Kelamin=Jenis.Kelamin,
                          Tipe.Residen=Tipe.Residen, Segmentasi=segmentasi, 
                          Segmen.Pelanggan=Segmen.Pelanggan, 
                          field_yang_digunakan=field_yang_digunakan)

#Data baru
databaru <- data.frame(Customer_ID="CUST-100", Nama.Pelanggan="Rudi Wilamar",
                       Umur=20,Jenis.Kelamin="Wanita",Profesi="Pelajar",
                       Tipe.Residen="Cluster",NilaiBelanjaSetahun=3.5)

#Menggabungkan data baru dengan variabel Identitas.Cluster
databaru <- merge(databaru, Identitas.Cluster$Profesi)
databaru <- merge(databaru, Identitas.Cluster$Jenis.Kelamin)
databaru <- merge(databaru, Identitas.Cluster$Tipe.Residen)
databaru

#Penentuan cluster untuk data baru
Identitas.Cluster$Segmen.Pelanggan[which.min(sapply( 1:5, function( x ) 
  sum( ( databaru[Identitas.Cluster$field_yang_digunakan] - 
           Identitas.Cluster$Segmentasi$centers[x,])^2 ) )),]