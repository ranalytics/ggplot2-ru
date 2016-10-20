# В этом файле приведены примеры кода из раздела 2.4 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 2.19 ---------------------------------
qplot(log(Infection + 1), data = dreissena,
      facets = Lake ~ ., geom = "histogram", binwidth = 0.2)

# ------------------------------- Рисунок 2.20 ---------------------------------
qplot(Lake, log(Infection + 1), data = dreissena,
      facets = . ~ Month, geom = "boxplot",
      colour = I("blue"), outlier.colour = "red")

# ------------------------------- Рисунок 2.21 ---------------------------------
qplot(Length, log(Infection + 1), data = dreissena,
      facets = Lake ~ Month, geom = c("point","smooth"))
