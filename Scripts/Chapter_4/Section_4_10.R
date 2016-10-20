# В этом файле приведены примеры кода из раздела 4.10 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 4.85 ---------------------------------
# Одномерная диаграмма рассеяния, на которой
# к x-координатам точек добавлен небольшой шум (geom_jitter):
p <- ggplot(data = subset(dreissena, Month == "May" &
                              Lake == "Batorino"), aes(Site, Length)) +
    geom_jitter(position = position_jitter(width = 0.2),
                alpha = 0.4)

# Добавим средние значения в виде крупных красных точек
(a <- p + stat_summary(fun.y = mean, geom = "point",
                       color = "red", size = 5))

# Добавим отрезки, символизирующие 0.25 и 0.75 квантили:
a + stat_summary(fun.y = mean,
                 fun.ymin = function(x){quantile(x, p = 0.25)},
                 fun.ymax = function(x){quantile(x, p = 0.75)},
                 geom = "errorbar", color = "blue", width = 0.25)

# ------------------------------- Рисунок 4.86 ---------------------------------
# Объект p определен как в коде для рис. 4.85
require(Hmisc) # для mean_cl_boot()
p + stat_summary(fun.data = mean_cl_boot,
                 color = "magenta", size = 1)
