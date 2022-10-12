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
>> Diketahui data dari  sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)

![Screenshot (392)](https://user-images.githubusercontent.com/114491445/195356794-979f1981-be4c-4a51-9a6b-6f0875d9f9b0.png)

### 3.A
Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
```R
lamda = 4.5
na = 6
p = dpois(na, lamda)
```
Penyelesaian ini dilakukan dengan distribusi poisson menggunakan fungsi dpois(). Fungsi ini menggunakan lamda yaitu rata-rata historis, na yaitu peluang 6 bayi dan p yaitu peluang. Hasil peluang yang didapat adalah 0.128120143864584

### 3.B
Simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama setahun (n = 365)

![Screenshot (393)](https://user-images.githubusercontent.com/114491445/195358944-ba49a4ab-d345-4608-b27b-9c62ec763a56.png)

```R
set.seed(2)
poisson_data  <- data.frame('data' = rpois(365, lamda))
poisson_data  %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == nA),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Angka kelahiran per periode',
       y = 'Proporei',
       title = 'Histogram Kelahiran Bayi dalam Setahun Menggunakan Distribusi Poisson (lambda = 4.5)') +
  theme_bw()
  ```
 Grafik ini dibuat menggunakan geom_histogram() dengan data yang sudah disediakan.

### 3.C
Bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan?
Poin a dan b memiliki hasil yang hampir mirip dimana pada poin a memiliki nilai sekitar 13%, sedangkan pada poin b sekitar 11%an. Hal ini dapat terjadi dikarenakan nilai A terdapat dalam range B. Sehingga, dalam estimasi 365 hari akan memberikan nilai hasil yang hampir sama.

### 3D
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
```R
rataan = varian = lamda
```
Hasil dari rataan dan varian sama dengan lamda yaitu 4.5


## Nomor 4
>> Diketahui nilai x = 2 dan v = 10. Tentukan:

![Screenshot (396)](https://user-images.githubusercontent.com/114491445/195364885-491c4800-7db6-4c80-86c0-d8ee1933da5f.png)

### 4.A
Fungsi Probabilitas dari Distribusi Chi-Square.
```R
x = 2
v = 10
probabilitas = dchisq(x, v)
probabilitas
```
Penyelesaian soal ini menggunakan distribusi Chi-Square dengan bantuan fungsi dchisq(). Fungsi ini menggunakan data x dan v.

### 4.B
Histogram dari Distribusi Chi-Square dengan 100 data random.

![Screenshot (397)](https://user-images.githubusercontent.com/114491445/195365690-4a35a128-2150-47ad-a187-3fd931b7bbc4.png)

```R
n = 100
hist(rchisq(n, v), xlab = "X", ylab = "V", main = "Grafik Distribusi Chi-Square")
```
Histogram ini dibuat dengan menggunakan fungsi hist() dengan angka dari fungsi distribusi Chi-Square sebagai parameternya.

### 4.C
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Chi-Square.
```R
rataan = v
varian = v * 2
```
Rataan sama dengan v. Varian merupakan hasil kali v atau rataan dikali 2.


## Nomor 5
>> Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3). Tentukan:

![Screenshot (398)](https://user-images.githubusercontent.com/114491445/195368426-1fe7f233-2d1b-488b-bf18-9dbc5fd0297d.png)

### 5.A
Fungsi Probabilitas dari Distribusi Exponensial 
```R
x = 3
probabilitas = dexp(x, rate = 1, log = FALSE)
```
Penyelesaian ini menggunakan fungsi dexp(). Hasilnya adalah 0.497870683678639

### 5.B
Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random

![Screenshot (399)](https://user-images.githubusercontent.com/114491445/195369170-762257bc-09dc-45bc-bebd-9b57f34e9810.png)

```R
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10, x), main = "Distribusi Exponensial")
hist(rexp(100,x), main = "Distribusi Exponensial")
hist(rexp(1000, x), main = "Distribusi Exponensial")
hist(rexp(10000,x), main = "Distribusi Exponensial")
```
Histogram distribusi exponensial ini menggunakan fungsi hist() dengan angka acak dari fungsi distribusi exponensial. Parameter yang digunakan sesuai permintaan yaitu 10, 100, 1000 dan 10000

### 5.C
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
Petunjuk: 
Gunakan set.seed(1)
Gunakan fungsi bawaan R
```R
simnum <- 100
n = 100
simdata <- matrix(rexp(simnum * n, x), simnum)
sim_rowmean <- apply(simdata, 1, mean)
sim_var <- var(sim_rowmean)
```
Nilai rataan dan varian dapat dicari menggunakan rumus di atas.


## Nomor 6
>>Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan :

![Screenshot (402)](https://user-images.githubusercontent.com/114491445/195373900-a7655e32-c05b-4328-822e-ef9f299e202c.png)
![Screenshot (401)](https://user-images.githubusercontent.com/114491445/195373923-00f32f9c-7c64-4286-ab09-3b45e6538ee8.png)

### 6.A
Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).
Keterangan : 
X1 = Dibawah rata-rata 
X2 = Diatas rata-rata
Contoh data :
1,2,4,2,6,3,10,11,5,3,6,8
rata-rata = 5.083333
X1 = 5
X2 = 6
```R
n <- 100
m <- 50
std.deviasi <- 8
set.seed(100)
random <- rnorm(100)
rata.rata <- mean(random)
x1 <- floor(rata.rata)
x2 <- ceiling(rata.rata)

z1 <- (x1 - m) / std.deviasi
z2 <- (x2 - m) / std.deviasi

rnorm(n = 100, mean = m, sd = std.deviasi)
plot(rnorm(n = 100, mean = m, sd = std.deviasi))
```
Hal yang dilakukan pertama untuk mendapatkan Z-Score adalah generate angka random menggunakan fungsi rnorm(). Lalu ditentukan nilai x1 dan x2 nya

### 6.B
Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan: 
NRP_Nama_Probstat_{Nama Kelas}_DNhistogram

![Screenshot (403)](https://user-images.githubusercontent.com/114491445/195374840-2ef43610-401b-462c-8b18-61cc1a588134.png)

Didapat dengan menggunakan code seperti berikut:
```R
hist(rnorm(n = 100, mean = m, sd = std.deviasi), xlab="x", ylab="y" ,breaks = 50,
     main = "5025211202_Glenaya_Probstat_A_DNhistogram")
```

### 6.C
Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
```R
varians <- std.deviasi ** 2
```
Hasil varian didapat dari standar deviasi dipangkat 2, sehingga hasilnya adalah 64.


# SEKIAN PRAKTIKUM SAYA, TERIMA KASIH.
