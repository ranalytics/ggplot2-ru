# В этом файле приведены примеры кода из раздела 4.8 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 4.63 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Naroch"),
            aes(x = log(Infection + 1)))
p + geom_density(fill = "orchid") + geom_rug()
p + geom_density(fill = "orchid") + geom_rug(colour = "red")
p + geom_density(fill = "orchid") + geom_rug(colour = "red", alpha = 0.3)

# ------------------------------- Рисунок 4.64 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Naroch"),
            aes(x = Length, y = log(Infection + 1)))
p + geom_rug()
p + geom_point() + geom_rug()
p + geom_point() + geom_rug(sides = "tr")

# ------------------------------- Рисунок 4.65 ---------------------------------
# Отдельная таблица данных по оз. Нарочь:
Naroch <- subset(dreissena, Lake == "Naroch")

# Добавим столбец с log-значениями интенсивности инвазии:
Naroch$logInf <- log(Naroch$Infection + 1)

# Рассчитаем медиану интенсивности инвазии (на log-шкале):
med.inf <- median(Naroch$logInf)

# Добавим столбец с метками уровеня инвазии -
# ниже ("Lower") или выше ("Higher") медианы:
Naroch$Level <- with(Naroch, ifelse(logInf < med.inf, "Lower", "Higher"))

# Инициализация диаграммы рассеяния, на которой цвет точек
# задан в соответствии с уровнем инвазии (Level):
p <- ggplot(data = Naroch, aes(x = Length, y = logInf, colour = Level)) +
    theme(legend.position = "none")

# Диаграмма рассеяния c горизонтальной линией,
# символизирующей медианный уровень инвазии:
p + geom_point() + geom_hline(yintercept = med.inf)

# То же, но внешний вид горизонтальной линии изменен:
p + geom_point() + geom_hline(yintercept = med.inf,
                              colour = "blue", linetype = 5, size = 1)

# Добавляем три горизонтальные линии, соответствующие
# 0.25, 0.5 и 0.75 процентилям интенсивности инвазии:
p + geom_point(colour = "gray40") +
    geom_hline(yintercept = quantile(Naroch$logInf,
                                     p = c(0.25, 0.5, 0.75)),
               colour = "blue")

# ------------------------------- Рисунок 4.66 ---------------------------------
# Рассчет среднего значения длины раковины дрейссены
# (по данным из таблицы Naroch - см. предыдущий пример):
mean.L <- mean(Naroch$Length)

# Добавляем столбец с метками класса mean.L -
# "Ниже" или "Выше" среднего значения:
Naroch$L.level <- with(Naroch, 
                       ifelse(Length < mean.L, "Lower", "Higher"))

# Инициализация диаграммы рассеяния, на которой цвет точек
# задан в соответствии с классом длины раковины (L.level):
p <- ggplot(data = Naroch, 
            aes(x = Length, y = logInf, colour = L.level)) +
    theme(legend.position = "none")

# Диаграмма рассеяния с вертикальной линией,
# символизирующей среднюю длину раковины:
p + geom_point() + geom_vline(xintercept = mean.L)

# То же, но внешний вид вертикальной линии изменен:
p + geom_point() + geom_vline(xintercept = mean.L,
                              colour = "blue", linetype = 5, size = 1)

# Добавляем три вертикальные линии, соответствующие
# 0.25, 0.5 и 0.75 процентилям длины раковины:
p + geom_point(colour = "gray40") +
    geom_vline(xintercept =  quantile(Naroch$Length, p = c(0.25, 0.5, 0.75)),
               colour = "blue")

# ------------------------------- Рисунок 4.67 ---------------------------------
set.seed(1022) # для воспроизводимости примера

# Таблица, содержащая случайно сгенерированные значения,
# которые будут использованы при определении координат
# прямоугольных областей:
df <- data.frame(x = sample(10, 20, replace = TRUE),
                 y = sample(10, 20, replace = TRUE))

p <- ggplot(df, aes(xmin = x, xmax = x + 1,
                    ymin = y, ymax = y + 2))
p + geom_rect()
p + geom_rect(fill = "orange")
p + geom_rect(fill = "orange", col = "black", linetype = 2)

# ------------------------------- Рисунок 4.68 ---------------------------------
# Этот пример основан на искусственных данных,
# созданных следующим образом:
df <- data.frame(X = c(1, 4, 5), XEND = c(2, 3, 6),
                 Y = c(1, 3, 5), YEND = c(2, 4, 6))

p <- ggplot(df, aes(x = X, xend = XEND, y = Y, yend = YEND))
p + geom_segment()
p + geom_segment(arrow = arrow(length = unit(0.5,"cm")), colour = "blue")
p + geom_segment(arrow = arrow(length = unit(0.5,"cm"), 
                               ends = "both"), colour = "red", size = 1)

# ------------------------------- Рисунок 4.69 ---------------------------------
set.seed(1100) # для воспроизводимости примера
df <- data.frame(X = sample(10, 20, replace = TRUE),
                 Y = sample(10, 20, replace = TRUE),
                 Time = 1:20)
p <- ggplot(df, aes(x = X, y = Y)); p + geom_path()
p + geom_path(aes(colour = Time), size = 1)

# ------------------------------- Рисунок 4.70 ---------------------------------
df <- data.frame(x = 1:3, y = c(4, 1, 9))
p <- ggplot(df, aes(x, y)) + xlim(c(0, 4)) + ylim(c(0, 10))
p + geom_path(size = 10, lineend = "round") # "A"
p + geom_path(size = 10, lineend = "butt") # "B"
p + geom_path(size = 10, lineend = "square") # "C"
p + geom_path(size = 10, lineend = "round",
              linejoin = "round") # "D"
p + geom_path(size = 10, lineend = "round",
              linejoin = "mitre") # "E"
p + geom_path(size = 10, lineend = "round",
              linejoin = "bevel") # "F"

# ------------------------------- Рисунок 4.71 ---------------------------------
set.seed(1100)
df <- data.frame(X = sample(10, 20, replace = TRUE),
                 Y = sample(10, 20, replace = TRUE),
                 Time = 1:20)
p <- ggplot(df, aes(x = X, y = Y))
p + geom_path(aes(size = Time), alpha = 0.4, colour = "tomato")
p + geom_path(aes(size = Time), alpha = 0.4, colour = "tomato", lineend = "round")

# ------------------------------- Рисунок 4.72 ---------------------------------
# Этот пример основан на искусственных данных.
# ids - это идентификаторы отдельных частей многоугольника:
ids <- factor(c("1.1", "2.1", "1.2", "2.2", "1.3", "2.3"))
positions <- data.frame( id = rep(ids, each = 4),
                         x = c(2, 1, 1.1, 2.2, 1, 0, 0.3, 1.1, 2.2, 1.1, 1.2, 2.5,
                               1.1, 0.3, 0.5, 1.2, 2.5, 1.2, 1.3, 2.7, 1.2, 0.5,
                               0.6, 1.3),
                         y = c(-0.5, 0, 1, 0.5, 0, 0.5, 1.5, 1, 0.5, 1, 2.1,
                               1.7, 1, 1.5, 2.2, 2.1, 1.7, 2.1, 3.2, 2.8, 2.1,
                               2.2, 3.3, 3.2))
p <- ggplot(data = positions, aes(x = x, y = y, group = id))
p + geom_polygon()
p + geom_polygon(colour = "white", fill = "blue")
p + geom_polygon(colour = "white", fill = "blue", size = 1.6)

# ------------------------------- Рисунок 4.73 ---------------------------------
# В этом примере отдельные части многоугольника, координаты
# которого хранятся в таблице positions (см. рис. 4.72),
# будут залиты цветом в соответствии со значениями третьей
# количественной переменной. Значения такой переменной обычно
# хранятся в отдельной таблице. Перед созданием графика
# обе таблицы должны быть объединены (команда merge ниже).
values <- data.frame(id = ids, value = c(4.5, 3.8, 3.2, 3, 2.5, 1.4))
polygon <- merge(values, positions, by = c("id"))
ggplot(data = polygon, aes(x = x, y = y, group = id)) +
    geom_polygon(aes(fill = value))

# ------------------------------- Рисунок 4.74 ---------------------------------
# Расчет медианных значений интенсивности инвазии
# (с сохранением результатов в отдельной таблице):
library(doBy)
medInfection <- summaryBy(
    Infection ~ Site + Day, FUN = median,
    data = subset(dreissena, Lake == "Naroch"))

p <- ggplot(data = subset(medInfection, Site == "S9"),
            aes(x = Day, y = Infection.median))
p + geom_area()
p + geom_area(fill = "skyblue")
p + geom_area(colour = 4, fill = "white", alpha = 0.6, linetype = 2, size = 2)

# ------------------------------- Рисунок 4.75 ---------------------------------
p <- ggplot(data = medInfection, aes(x = Day, y = Infection.median))
p + geom_area(aes(fill = Site))

# ------------------------------- Рисунок 4.76 ---------------------------------
library(dplyr) # для group_by() и summarise()
by.lake <- dreissena %>% group_by(Lake) %>%
    summarise(Length = round(median(Length)),
              Infection = round(median(Infection)))
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(aes(label = Lake)) +
    xlim(11, 20) + ylim(150, 750)
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(aes(label = Lake), hjust = 1.2) +
    xlim(11, 20) + ylim(150, 750)
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(aes(label = Lake), hjust = 1.2,
              vjust = -1.2) + xlim(11, 20) + ylim(150, 750)

# ------------------------------- Рисунок 4.77 ---------------------------------
# Объект by.lake определен как на рис. 4.76
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(aes(label = Lake), hjust = 1.2, colour = "red") +
    xlim(11, 20) + ylim(120, 750)
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(aes(label = Lake), hjust = 1.2, colour = "red", angle = 15) +
    xlim(11, 20) + ylim(120, 750)

# ------------------------------- Рисунок 4.78 ---------------------------------
# Объект by.lake определен как на рис. 4.76
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(aes(label = Lake), hjust = 1.2, family = "mono") + 
    xlim(11, 20) + ylim(120, 750)
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(aes(label = Lake, hjust = 1.2,
                  fontface = c("plain", "bold",
                               "italic")[as.numeric(Lake)])) +
    xlim(11, 20) + ylim(120, 750)

# ------------------------------- Рисунок 4.79 ---------------------------------
# Объект by.lake определен как на рис. 4.76
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(aes(label = Lake, size = Infection), hjust = 1.2) +
    xlim(11, 20) + ylim(120, 750)
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(data = NULL, label = "Some text",
              x = 16, y = 700) + xlim(11, 20) + ylim(120, 750)

# ------------------------------- Рисунок 4.80 ---------------------------------
# Объект by.lake определен как на рис. 4.76
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(aes(label = paste("over(", Infection, ", host)")),
              parse = TRUE, hjust = 1.3) +
    xlim(11, 20) + ylim(120, 750)
ggplot(data = by.lake, aes(Length, Infection)) +
    geom_point(colour = "blue", size = 4) +
    geom_text(aes(label = paste("rho[est.]==",
                                round(cor(Length, Infection), 2), sep = "")),
              size = 10, parse = TRUE, x = 16.5, y = 600)

