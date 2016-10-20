# В этом файле приведены примеры кода из раздела 7.1 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 7.2 ----------------------------------
qplot(Length, sqrt(Infection), data = dreissena) +
    facet_grid(facets = . ~ Lake)

# ------------------------------- Рисунок 7.3 ----------------------------------
qplot(Length, data = dreissena, geom = "histogram") +
    facet_grid(Lake ~ .)
# обратите внимание: имя аргумента facets при вызове
# функции facet_grid указывать необязательно

# ------------------------------- Рисунок 7.4 ----------------------------------
qplot(Length, sqrt(Infection), data = dreissena) +
    facet_grid(Lake ~ Month)

# ------------------------------- Рисунок 7.5 ----------------------------------
qplot(Length, sqrt(Infection), data = dreissena, alpha = I(0.4)) +
    facet_grid(facets = Lake ~ Month, margins = TRUE)

# ------------------------------- Рисунок 7.6 ----------------------------------
qplot(Length, sqrt(Infection), data = dreissena, alpha = I(0.4)) +
    facet_grid(facets = Lake ~ Month, margins = c("Month"))

# ------------------------------- Рисунок 7.7 ----------------------------------
qplot(Length, sqrt(Infection), data = dreissena, alpha = I(0.4)) +
    facet_grid(facets = Lake ~ Month, scales = "free")

# ------------------------------- Рисунок 7.8 ----------------------------------
qplot(Length, sqrt(Infection), data = dreissena, alpha = I(0.4)) + 
    facet_grid(Lake ~ Month, scales = "free", space = "free")

# ------------------------------- Рисунок 7.9 ----------------------------------
qplot(Length, sqrt(Infection), data = dreissena, alpha = I(0.4)) +
    facet_grid(facets = . ~ Lake, labeller = label_both)

# ------------------------------- Рисунок 7.10 ---------------------------------
dreissena$dummy <- factor(dreissena$Lake,
                          labels = c("x == frac(x[i], n)", "y == frac(y[i], n)",
                                     "z == frac(z[i], n)"))
qplot(Length, sqrt(Infection),
      data = dreissena, alpha = I(0.4)) +
    facet_grid(facets = . ~ dummy, labeller = label_parsed)

