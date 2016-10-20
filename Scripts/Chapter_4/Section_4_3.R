# В этом файле приведены примеры кода из раздела 4.3 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 4.26 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Naroch"),
            aes(x = Length, y = log(Infection + 1))) + geom_point()
p + stat_density2d()
p + stat_density2d(n = 10)

# ------------------------------- Рисунок 4.27 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Naroch" & Month == "May"),
            aes(x = Length, y = log(Infection + 1))) +
    geom_point(aes(colour = Site))
p + stat_density2d(aes(colour = Site))
p + stat_density2d(aes(colour = Site), alpha = 0.4)

# ------------------------------- Рисунок 4.28 ---------------------------------
# матрица volcano преобразована в таблицу данных:
volcano3d <- reshape2::melt(volcano)
names(volcano3d) <- c("x", "y", "z")

# Построение графиков:
p <- ggplot(data = volcano3d, aes(x = x, y = y, z = z))
p + geom_contour()
p + geom_contour(bins = 5)

# ------------------------------- Рисунок 4.29 ---------------------------------
p + geom_contour(bins = 50, colour = "rosybrown")
p + geom_contour(bins = 50, size = 0.5,
                 colour = "rosybrown", alpha = 0.5) +
    geom_contour(bins = 5, size = 1)

# ------------------------------- Рисунок 4.30 ---------------------------------
p + geom_contour(aes(colour = ..level..))
p + geom_tile(aes(fill = z)) + geom_contour()

# ------------------------------- Рисунок 4.31 ---------------------------------
library(hexbin)
p <- ggplot(data = dreissena, aes(x = Length, y = log(Infection + 1)))
p + geom_point()
p + geom_hex()
p + geom_hex(bins = 10)

# ------------------------------- Рисунок 4.32 ---------------------------------
# Объект p определен как на рис. 4.31
p + geom_hex(bins = c(2, 30), alpha = 0.6)
p + geom_hex(bins = 10, colour = "red")

