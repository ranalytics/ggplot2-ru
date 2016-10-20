# В этом файле приведены примеры кода из раздела 2.3 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 2.6 ----------------------------------
qplot(log(Length), log(Infection + 1),
      geom = c("point", "smooth"), 
      data = dreissena)

# ------------------------------- Рисунок 2.7 ----------------------------------
qplot(Lake, log(Infection + 1), data = dreissena,
      geom = "jitter", alpha = I(0.6))

# ------------------------------- Рисунок 2.8 ----------------------------------
qplot(Lake, log(Infection + 1), data = dreissena,
      geom = "jitter", alpha = I(0.6), colour = Month)
qplot(Lake, log(Infection + 1), data = dreissena,
      geom = "jitter", alpha = I(0.6), colour = Month,
      size = Length)

# ------------------------------- Рисунок 2.10 ---------------------------------
qplot(Lake, log(Infection + 1), data = dreissena, geom = "boxplot")
qplot(Lake, log(Infection + 1), data = dreissena, 
      geom = "boxplot", colour = "red")
qplot(Lake, log(Infection + 1), data = dreissena,
      geom = "boxplot", fill = "coral")

# ------------------------------- Рисунок 2.11 ---------------------------------
qplot(Lake, log(Infection + 1), data = dreissena,
      geom = c("jitter", "boxplot"), alpha = I(1/5),
      outlier.colour = NA)
# отображение "выбросов" отключено
# во избежание дублирования точек, являющихся
# одновременно частью диаграммы рассеяния

# ------------------------------- Рисунок 2.12 ---------------------------------
qplot(Infection, data = dreissena, geom = "histogram", xlim = c(0, 11000))
qplot(Infection, data = dreissena, geom = "histogram", binwidth = 1000,
      xlim = c(0, 11000))
qplot(Infection, data = dreissena, geom = "histogram", binwidth = 50, 
      xlim = c(0, 11000))

# ------------------------------- Рисунок 2.13 ---------------------------------
qplot(log(Infection + 1), data = dreissena,
      geom = "histogram", fill = Lake)

# ------------------------------- Рисунок 2.14 ---------------------------------
qplot(log(Infection + 1), data = dreissena, geom = "density")
qplot(log(Infection + 1), data = dreissena,
      geom = "density", adjust = 0.5)

# ------------------------------- Рисунок 2.15 ---------------------------------
qplot(log(Infection + 1), data = dreissena, geom = "density", colour = Lake)
qplot(log(Infection + 1), data = dreissena, geom = "density",
      fill = Lake, alpha = I(1/4))

# ------------------------------- Рисунок 2.16 ---------------------------------
qplot(log(Infection + 1), data = dreissena, geom = "freqpoly")
qplot(log(Infection + 1), data = dreissena,
      geom = "freqpoly", binwidth = 0.8)
qplot(log(Infection + 1), data = dreissena,
      geom = "freqpoly", binwidth = 0.7, colour = Month)

# ------------------------------- Рисунок 2.17 ---------------------------------
qplot(Lake, data = dreissena, geom = "bar")
qplot(Lake, data = dreissena, geom = "bar", weight = Infection)

# ------------------------------- Рисунок 2.18 ---------------------------------
qplot(Lake, data = dreissena, geom = "bar", fill = Month)

