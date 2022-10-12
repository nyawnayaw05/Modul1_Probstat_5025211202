# Modul1_Probstat_5025211202
Praktikum Probstat 1 Glenaya (5025211202)

## Nomor 1
>> Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan seseorang yang menghadiri acara vaksinasi sebelumnya. 

![Screenshot (386)](https://user-images.githubusercontent.com/114491445/195337470-379ae141-2c70-4594-b67d-d751cddadc16.png)

### 1.A
Berapa peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi  sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi? (distribusi Geometrik)
```R 
p = 0.2
x = 3
peluang = dgeom(x,p)
```
Penyelesaian soal ini menggunakan fungsi dgeom() dimana fungsi ini berguna untuk mengembalikan value pdf dari distribusi geometrik. Peluang yang didapat adalah sebesar 0.1024

### 1.B
Mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )
```R
mean = mean(rgeom(n = 10000, p = 0.20) == 3)
```
Penyelesaian soal ini memakai rumus mean (rata-rata) dengan fungsi rgeom() dimana fungsi ini mengembalikan nilai variabel random dari distribusi geometrik. Hasil mean ini dapat berubah-ubah dikarenakan variabel random tersebut. Hasil yang saya dapatkan adalah sebesar 0.1028

### 1.C
Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
Hasil yang didapat dari poin a dan b adalah beda. Pada poin A, didapatkan hasil 0.1024 dan nilainya akan selalu tetap. Hal itu terjadi dikarenakan menggunakan cara distribusi geometrik biasa sehingga nilainya tetap dan tidak diacak. Sedangkan poin B memiliki hasil yang berubah-ubah dikarenakan menggunakan fungsi rgeom() dimana fungsi itu menggunakan variabel random.

### 1.D
Histogram distribusi Geometrik, dengan peluang X = 3 gagal sebelum sukses pertama
```R
x = 0:10
data.frame(x, prob = dgeom(x, p = 0.20)) %>%
  mutate(Failures = ifelse(x == 3, 3, "Data yang lain")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() + 
  geom_text(
    aes(label = round(prob, 2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
labs(title = "Probabilitas X = 3 Gagal Sebelum Kesuksesan Pertama",
     x = "Gagal yang terjadi sebelum sukses pertama (x)",
     y = "Peluang")
 ```
Membuat histogram digunakan fungsi hist() ddengan parameter fungsi distribusi geometrik seperti poin-poin yang sebelumnya.

### 1.E
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.
```R
varian = (1-p)/p^2
rataan = 1/p
```
Penyelesaian ini menggunakan rumus varian dan rataan itu sendiri.


## Nomor 2
>> Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :
![Screenshot (390)](https://user-images.githubusercontent.com/114491445/195352447-fc2e6e86-fdb2-4916-9f95-e49ccf4a42aa.png)

### 2.A
Peluang terdapat 4 pasien yang sembuh.
```R
prob = 0.2
ns = 20
na = 4
peluang = dbinom(na, ns, prob)
```
Penyelesaian ini dilakukan dengan distribusi binomial menggunakan fungsi dbinom(). Fungsi menggunakan na, ns, dan prob. Dimana prob adalah peluang sembuh, na adalah pasien yang sembuh, dan ns adalah total pasien. Hasilnya adalah 0.218199401946101

### 2.B
Gambarkan grafik histogram berdasarkan kasus tersebut.
![Screenshot (391)](https://user-images.githubusercontent.com/114491445/195353038-ca2582d1-ca32-49fa-9629-b11574cf9f8d.png)
```R
x = rbinom(na, ns, prob)
hist(x, main = "Distribusi Binomial (ns = 20, p = 0.2)", xlab = "Sukses", ylab = "Probabilitas")
```
Grafik ini dibuat menggunakan fungsi hist().

### 2.C
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.
```R
rataan = ns * prob
varian = ns * prob * (1 - prob)
```
Untuk mendapatkan nilai rataan dan varian menggunakan rumus seperti di atas sesuai dengan data yang didapat.


## Nomor 3















