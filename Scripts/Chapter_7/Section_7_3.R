# В этом файле приведены примеры кода из раздела 7.3 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунки 7.11 и 7.12 --------------------------
qplot(Length, sqrt(Infection), data = dreissena, alpha = I(0.4)) +
    facet_wrap(facets = ~ Month, ncol = 1)
qplot(Length, sqrt(Infection), data = dreissena, alpha = I(0.4)) +
    facet_wrap(facets = ~ Month, nrow = 2)

# ------------------------------- Рисунок 7.13 ---------------------------------
qplot(Length, sqrt(Infection), data = dreissena, alpha = I(0.4)) +
    facet_wrap(facets = ~ Lake + Month)
