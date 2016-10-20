# В этом файле приведены примеры кода из раздела 5.5 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 5.18 ---------------------------------
library(dplyr) # для filter() и %>%
nar <- dreissena %>% filter(Lake == "Naroch", Month %in% c("May", "July"))
p <- ggplot(nar, aes(Length, Infection/1000)) +
    geom_point() + scale_x_continuous(trans = "sqrt") +
    scale_y_continuous(trans = "sqrt")
p + aes(shape = Month) + scale_shape_manual(values = c(1, 2))
p + aes(shape = Month, size = Month) +
    scale_shape_manual(values = c(1, 2)) +
    scale_size_manual(values = c(5, 2))

# ------------------------------- Рисунок 5.19 ---------------------------------
# Объекты nar и p определены как на предыдущем рисунке
library(RColorBrewer)
p + aes(colour = Month) + scale_colour_manual(values = c("blue", "pink"))

# Цвета из палитры Dark2 пакета RColorBrewer:
cols <- brewer.pal(3, "Dark2")
( p3 <- p + aes(colour = Month) + scale_colour_manual(values = cols) )

# ------------------------------- Рисунок 5.20 ---------------------------------
# Объект nar определен как на рис. 5.18
library(dplyr) # для group_by(), summarise() и %>%
by.month <- dreissena %>% group_by(Lake, Month) %>%
    summarise(Infection = median(Infection))

# Цвета из палитры Set1 пакета RColorBrewer:
cols <- brewer.pal(3, "Set1")
ggplot(by.month, aes(Month, Infection, group = Lake, colour = Lake)) + 
    geom_point() +
    geom_line() + scale_colour_manual(values = cols)
ggplot(nar, aes(Infection, fill = Month)) +
    geom_histogram() + scale_fill_manual(values = cols)

# ------------------------------- Рисунок 5.21 ---------------------------------
# объект by.month определен как на рис. 5.20
by.month$Color <- c(rep("black", 3), rep("red", 3), rep("blue", 3))

ggplot(by.month, aes(Month, Infection, group = Lake, colour = Color)) +
    geom_point() + geom_line() +
    scale_colour_identity(guide = "legend", name = "Lake",
                          labels = c("Batorino", "Naroch", "Myastro"))
# По умолчанию аргумент guide = "none", т.е. легенда не добавляется 
# (для ее включения используется аргумент guide = "legend")

