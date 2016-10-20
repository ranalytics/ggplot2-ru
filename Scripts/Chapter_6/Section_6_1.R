# В этом файле приведены примеры кода из раздела 6.1 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 6.1 ----------------------------------
ggplot(data = dreissena, aes(Length, sqrt(Infection))) +
    geom_point(alpha = 0.5) + geom_smooth()
ggplot(data = dreissena, aes(Length, sqrt(Infection))) +
    geom_point(alpha = 0.5) + geom_smooth() +
    coord_cartesian(xlim = c(10, 20), ylim = c(0, 40))
ggplot(data = dreissena, aes(Length, sqrt(Infection))) +
    geom_point(alpha = 0.5) + geom_smooth() +
    scale_x_continuous(limits = c(10, 20)) +
    scale_y_continuous(limits = c(0, 40))

# ------------------------------- Рисунок 6.2 ----------------------------------
ggplot(data = dreissena, aes(Length, sqrt(Infection))) +
    geom_point(alpha = 0.5) + geom_smooth()
ggplot(data = dreissena, aes(sqrt(Infection), Length)) +
    geom_point(alpha = 0.5) + geom_smooth()
ggplot(data = dreissena, aes(Length, sqrt(Infection))) +
    geom_point(alpha = 0.5) + geom_smooth() + coord_flip()

# ------------------------------- Рисунок 6.3 ----------------------------------
p <- ggplot(data = dreissena) + geom_point(alpha = 0.5)
p + aes(Length, sqrt(Infection))
p + aes(Length, Infection) +
    scale_y_continuous(trans = "sqrt")
p + aes(Length, Infection) + coord_trans(y = "sqrt")

# ------------------------------- Рисунок 6.4 ----------------------------------
p <- ggplot(data = dreissena, aes(Length, sqrt(Infection))) +
    geom_point(alpha = 0.5)
p + coord_fixed(ratio = 1)
p + coord_fixed(ratio = 1.5)
p + coord_fixed(ratio = 0.2)

