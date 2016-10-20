# В этом файле приведены примеры кода из раздела 6.3 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 6.7 ----------------------------------
library(maps) # пакет с картами нескольких стран и всего мира
library(mapproj)
it <- map_data("italy") # карта Италии
itmap <- ggplot(it, aes(x = long, y = lat, group = group)) +
    geom_polygon(fill = "white", colour = "black")
itmap + coord_map("mercator")
itmap + coord_map("orthographic")
itmap + coord_map("stereographic")
itmap + coord_map("conic", lat0 = 0)

# ------------------------------- Рисунок 6.8 ----------------------------------
world <- map_data("world")
worldmap <- ggplot(world, aes(x = long, y = lat, group = group)) +
    geom_path() +
    scale_y_continuous(breaks = (-2:2) * 30) +
    scale_x_continuous(breaks = (-4:4) * 45)
worldmap + coord_map("orthographic")
worldmap + coord_map("orthographic", orientation = c(-90, 0, 0))
worldmap + coord_map("orthographic", orientation = c(40, 30, 20))
