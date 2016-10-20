# В этом файле приведены примеры кода из раздела 2.2 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 2.1 ----------------------------------
qplot(x = Length, y = Infection, data = dreissena)

# ------------------------------- Рисунок 2.2 ----------------------------------
qplot(x = log(Length),
      y = log(Infection + 1), data = dreissena)
# поскольку некоторые значения Infection равны 0,
# логарифмирование выполнено для (Infection + 1)

# ------------------------------- Рисунок 2.3 ----------------------------------
qplot(log(Length), log(Infection + 1), data = dreissena, colour = Month)
qplot(log(Length), log(Infection + 1), data = dreissena, shape = Lake)

# ------------------------------- Рисунок 2.4 ----------------------------------
qplot(Length, Infection, alpha = I(1/2), data = dreissena)
qplot(Length, Infection, alpha = I(1/4), data = dreissena)
qplot(Length, Infection, alpha = I(1/8), data = dreissena)

# ------------------------------- Рисунок 2.5 ----------------------------------
qplot(log(Length), log(Infection + 1), data = dreissena,
      size = Day, alpha = I(0.25), colour = I("magenta"))

