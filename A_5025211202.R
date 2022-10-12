library(dplyr)
library(ggplot2)

# 1.A
p = 0.2
x = 3
peluang = dgeom(x,p)

# 1.B
mean = mean(rgeom(n = 10000, p = 0.20) == 3)

# 1.C : jawaban ada di readme

# 1.D
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

# 1.E
varian = (1-p)/p^2
rataan = 1/p


# 2.A
prob = 0.2
ns = 20
na = 4
peluang = dbinom(na, ns, prob)

# 2.B
x = rbinom(na, ns, prob)
hist(x, main = "Distribusi Binomial (ns = 20, p = 0.2)", xlab = "Sukses", ylab = "Probabilitas")

# 2.C
rataan = ns * prob
varian = ns * prob * (1 - prob)


# 3.A
lamda = 4.5
na = 6
p = dpois(na, lamda)

# 3.B
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

# 3.C : jawaban di ReadMe

# 3.D
rataan = varian = lamda



# 4.A
x = 2
v = 10
probabilitas = dchisq(x, v)
probabilitas

# 4.B
n = 100
hist(rchisq(n, v), xlab = "X", ylab = "V", main = "Grafik Distribusi Chi-Square")

# 4.C
rataan = v
varian = v * 2


# 5.A
x = 3
probabilitas = dexp(x, rate = 1, log = FALSE)

# 5.B
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10, x), main = "Distribusi Exponensial")
hist(rexp(100,x), main = "Distribusi Exponensial")
hist(rexp(1000, x), main = "Distribusi Exponensial")
hist(rexp(10000,x), main = "Distribusi Exponensial")

# 5.C
simnum <- 100
n = 100
simdata <- matrix(rexp(simnum * n, x), simnum)
sim_rowmean <- apply(simdata, 1, mean)
sim_var <- var(sim_rowmean)


# 6.A
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

# 6.B
hist(rnorm(n = 100, mean = m, sd = std.deviasi), xlab="x", ylab="y" ,breaks = 50,
     main = "5025211202_Glenaya_Probstat_A_DNhistogram")

# 6.C
varians <- std.deviasi ** 2

