# В этом файле приведены примеры кода из раздела 5.2 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 5.1 ----------------------------------
( p <- ggplot(dreissena, aes(Lake, Length)) + geom_boxplot(aes(fill = Month)) )
p + xlab("Озеро") + ylab("Длина, мм") + scale_fill_discrete("Месяц")
# Команда, аналогичная предыдущей:
p + labs(x = "Озеро", y = "Длина, мм", fill = "Месяц")

# ------------------------------- Рисунок 5.2 ----------------------------------
ggplot(subset(dreissena, Lake == "Naroch"), aes(Length, sqrt(Infection))) +
    geom_point(alpha = 0.5)
ggplot(subset(dreissena, Lake == "Naroch"), aes(Length, sqrt(Infection))) +
    geom_point(alpha = 0.5) +
    scale_x_continuous(breaks = c(3, 12, 22)) +
    scale_y_continuous(breaks = c(10, 45))
ggplot(subset(dreissena, Lake == "Naroch"), aes(Length, sqrt(Infection))) +
    geom_point(alpha = 0.5) +
    scale_x_continuous(breaks = c(3, 12, 22),
                       labels = c("L1", "L2", "L3")) +
    scale_y_continuous(breaks = c(10, 45),
                       labels = c("L4", "L5"))

# ------------------------------- Рисунок 5.3 ----------------------------------
ggplot(dreissena, aes(Lake, Length)) + geom_boxplot() +
    scale_x_discrete(labels = abbreviate)
ggplot(dreissena, aes(Lake, Length)) + geom_boxplot() +
    scale_y_continuous(breaks = c(5, 15, 25), labels = scientific)

# ------------------------------- Рисунок 5.4 ----------------------------------

