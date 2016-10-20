# В этом файле приведены примеры кода из раздела 4.9 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 4.81 ---------------------------------
gadm <- readRDS(gzcon(url("http://biogeo.ucdavis.edu/data/gadm2.8/rds/BLR_adm2.rds")))

# просмотр содержимого объекта gadm:
slotNames(gadm)

library(broom) # для функции tidy()
library(maps); library(rgeos); library(maptools)
# При помощи аргумента region со значением "NAME_2"
# мы указываем переменную, в которой хранятся
# идентификаторы административных единиц - районов:
counties <- tidy(gadm, region = "NAME_2")

# просмотр структуры объекта counties:
str(counties)

# построение карты:
library(mapproj)
ggplot() + geom_map(data = counties,
                    aes(map_id = id),
                    map = counties, color = "gray70") +
    expand_limits(x = counties$long,
                  y = counties$lat) +
    coord_map("polyconic")


# ------------------------------- Рисунок 4.82 ---------------------------------
# объект gadm определен как на рис. 4.81

set.seed(1234) # для воспроизводимости результата
fake_data <- gadm@data
fake_data$Value <- rnorm(nrow(fake_data))

ggplot() + geom_map(data = fake_data,
                    aes(map_id = NAME_2, fill = Value),
                    map = counties) +
    expand_limits(x = counties$long, y = counties$lat) +
    coord_map("polyconic")

# ------------------------------- Рисунок 4.83 ---------------------------------
library(scales) # для функции muted() (см. ниже)
ggplot() + geom_map(data = fake_data,
                    aes(map_id = NAME_2, fill = Value),
                    colour = "gray", map = counties) +
    expand_limits(x = counties$long,
                  y = counties$lat) +
    scale_fill_gradient2(low = muted("blue"),
                         midpoint = 0,
                         mid = "white",
                         high = muted("red"),
                         limits = c(min(fake_data$Value),
                                    max(fake_data$Value))) +
    coord_map("polyconic")

# ------------------------------- Рисунок 4.84 ---------------------------------
ggplot() + geom_map(data = fake_data,
                    aes(map_id = NAME_2, fill = Value),
                    colour = "gray", map = counties) +
    expand_limits(x = counties$long, y = counties$lat) +
    scale_fill_gradient2(low = muted("blue"),
                         midpoint = 0, mid = "white",
                         high = muted("red"),
                         limits = c(min(fake_data$Value),
                                    max(fake_data$Value))) +
    coord_map("polyconic") +
    theme(axis.line = element_blank(),
          axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          plot.background = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          panel.background = element_blank() )

