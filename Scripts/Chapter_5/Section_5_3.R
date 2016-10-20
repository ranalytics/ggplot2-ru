# В этом файле приведены примеры кода из раздела 5.3 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 5.4 ----------------------------------
ggplot(subset(dreissena, Lake == "Naroch"), aes(sqrt(Length), Infection)) +
    geom_point(alpha = 0.5)
ggplot(subset(dreissena, Lake == "Naroch"), aes(Length, Infection)) + 
    geom_point(alpha = 0.5) +
    scale_x_continuous(trans = "sqrt")

# ------------------------------- Рисунок 5.5 ----------------------------------
library(scales)
ggplot(subset(dreissena, Lake == "Naroch"), aes(Infection)) +
    geom_histogram() +
    scale_x_continuous(trans = "log")
ggplot(subset(dreissena, Lake == "Naroch"), aes(Infection)) +
    geom_histogram() +
    scale_x_continuous(trans = "log",
                       breaks = trans_breaks("log", "exp"),
                       labels = trans_format("log", math_format(e^.x)))

# ------------------------------- Рисунок 5.6 ----------------------------------
ggplot(subset(dreissena, Lake == "Naroch"),
       aes(Length, sqrt(Infection))) + geom_point(alpha = 0.5) +
    scale_x_continuous(expand = c(0, 0))
ggplot(subset(dreissena, Lake == "Naroch"),
       aes(Length, sqrt(Infection))) + geom_point(alpha = 0.5) +
    scale_x_continuous(expand = c(0.5, 0))
ggplot(subset(dreissena, Lake == "Naroch"),
       aes(Length, sqrt(Infection))) + geom_point(alpha = 0.5) +
    scale_x_continuous(expand = c(0, 8))

# ------------------------------- Рисунок 5.7 ----------------------------------
( p <- ggplot(economics, aes(date, psavert/100)) +
      geom_line() + scale_y_continuous(labels = percent) +
      labs(x = "Year", y = "Personal savings rate") )
( p2 <- p + scale_x_date(breaks = date_breaks("5 years"),
                         labels = date_format("%Y")) )

# ------------------------------- Рисунок 5.8 ----------------------------------
# Пример основан на искусственных данных:
dat <- data.frame(times =
                      seq(as.POSIXct("2011-10-20 00:00:00"),
                          as.POSIXct("2011-10-20 23:59:59"),
                          by = "30 min"),
                  y = rnorm(48))

# Метки делений отражают только время:
(p3 <- ggplot(dat, aes(x = times, y = y)) + geom_line() +
    scale_x_datetime(breaks = date_breaks("4 hours"),
                     labels = date_format("%H:%M:%S")))

# Метки делений отражают дату (день) и время:
(p3 + scale_x_datetime(breaks = date_breaks("6 hours"),
                       labels = date_format("%b%d\n%H:%M:%S")))

# ------------------------------- Рисунок 5.9 ----------------------------------
library(dplyr) # для group_by(), summarise() и %>%
by.lake <- dreissena %>% group_by(Lake) %>%
    summarise(Length = round(median(Length)),
              Infection = round(median(Infection)))
ggplot(by.lake, aes(Lake, Infection)) + geom_point() +
    geom_segment(aes(x = Lake, y = 0,
                     xend = Lake,
                     yend = Infection))
# Изменение порядка расположения уровней переменной Lake
# в соответствии со значениями переменной Length:
ggplot(by.lake, aes(reorder(Lake, Length), Infection)) +
    geom_point() + geom_segment(aes(x = Lake, y = 0,
                                    xend = Lake,
                                    yend = Infection))

# ------------------------------- Рисунок 5.10 ---------------------------------
(p <- ggplot(dreissena, aes(Lake, Length)) +
     geom_boxplot() +
     scale_x_discrete(limits = c("Batorino", "Naroch")))
p + scale_x_discrete(name = "Two Lakes",
                     limits = c("Batorino", "Naroch"),
                     labels = c("Batorino" = "B", "Naroch" = "N"))
