# В этом файле приведены примеры кода из раздела 5.4 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 5.12 ---------------------------------
library(dplyr) # для filter() и %>%
nar <- dreissena %>% filter(Lake == "Naroch")

# цвета для низких и высоких значений Day заданы при помощи
# аргументов low и high функции scale_color_gradient():
ggplot(nar, aes(Length, Infection/1000, colour = Day)) +
    geom_point() +
    scale_x_continuous(trans = "sqrt") +
    scale_y_continuous(trans = "sqrt") +
    scale_color_gradient(low = "blue", high = "red")

# Цвета заливки столбцов гистограммы указаны с использованием
# шестнадцатеричной схемы:
ggplot(nar, aes(Infection/1000, fill = ..count..)) +
    geom_histogram() +
    scale_x_continuous(trans = "sqrt") +
    scale_fill_gradient(low = "#000000",
                        high = "#FFC0CB")

# ------------------------------- Рисунок 5.13 ---------------------------------
# Объект nar определен как на предыдущем рисунке
ggplot(nar, aes(Infection/1000, fill = ..count..)) +
    geom_histogram() +
    scale_x_continuous(trans = "sqrt") +
    scale_fill_gradient2(low = "red",
                         mid = "white",
                         high = "blue",
                         midpoint = 10)
ggplot(nar, aes(Infection/1000, fill = ..count..)) +
    geom_histogram() +
    scale_x_continuous(trans = "sqrt") +
    scale_fill_gradientn(colours = terrain.colors(4))

# ------------------------------- Рисунок 5.16 ---------------------------------
# Объект nar определен как на рис. 5.12
( p <- ggplot(nar, aes(Length, Infection/1000,
                       colour = Month)) + geom_point() +
      scale_x_continuous(trans = "sqrt") +
      scale_y_continuous(trans = "sqrt") )
p + scale_color_hue(h = c(200, 360))
p + scale_color_hue(h = c(200, 360), c = 30)
p + scale_color_hue(h = c(200, 360), c = 30, l = 80)

# ------------------------------- Рисунок 5.17 ---------------------------------
# Объект nar определен как на рис. 5.12
ggplot(nar, aes(Length, Infection/1000, colour = Month)) +
    geom_point() + scale_x_continuous(trans = "sqrt") +
    scale_y_continuous(trans = "sqrt") +
    scale_colour_brewer(type = "qual", palette = "Set1")
ggplot(nar, aes(Infection/1000, fill = Month)) +
    geom_histogram() +
    scale_x_continuous(trans = "sqrt") +
    scale_fill_brewer(type = "qual", palette = "Accent")
