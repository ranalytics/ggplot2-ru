# В этом файле приведены примеры кода из раздела 6.2 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 6.5 ----------------------------------
( p <- ggplot(data = dreissena, aes(factor(1), fill = Month)) + 
      geom_bar(width = 1) )
p + coord_polar(theta = "y")
p + coord_polar(theta = "x")

# ------------------------------- Рисунок 6.6 ----------------------------------
library(dplyr) # для summarise() и %>%
dreiss <- dreissena %>% group_by(Lake, Day) %>%
    summarise(Length = mean(Length))

ggplot(dreissena, aes(x = Lake)) + 
    geom_bar(width = 1, color = "black", fill = "lightblue") + 
    coord_polar(theta = "x")
ggplot(dreiss, aes(x = Day, y = Length, color = Lake)) +
    geom_line(size = 1) + coord_polar(theta = "x")
ggplot(dreiss, aes(x = Day, y = Length, color = Lake)) +
    geom_line(size = 1) + coord_polar(theta = "y")
