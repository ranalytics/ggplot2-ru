# В этом файле приведены примеры кода из раздела 4.4 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 4.33 ---------------------------------
library(doBy)

# Таблица с минимальными значениями:
MIN <- summaryBy(Length ~ Month, FUN = min,
                 data = subset(dreissena, Lake == "Myastro"))

# Таблица с максимальными значениями:
MAX <- summaryBy(Length ~ Month, FUN = max,
                 data = subset(dreissena, Lake == "Myastro"))

# Таблица со средними значениями:
MEAN <- summaryBy(Length ~ Month, FUN = mean,
                  data = subset(dreissena, Lake == "Myastro"))

# Таблица со стандартными ошибками:
SE <- summaryBy(Length ~ Month,
                FUN = function(x) sd(x)/sqrt(length(x)),
                data = subset(dreissena, Lake == "Myastro"))

# Сводная таблица с параметрами описательной статистики:
dat <- data.frame(MIN[1], MIN[2], MAX[2], MEAN[2], SE[2])
names(dat) <- c("Month", "Min", "Max", "Mean", "SE")

# Построение графиков:
p <- ggplot(data=dat, aes(x = Month, ymin = Min, ymax = Max))
p + geom_linerange() + ylab("Length")
p + geom_pointrange(aes(y = Mean))

# ------------------------------- Рисунок 4.34 ---------------------------------
# объект p определен как на рис. 4.33
p + geom_pointrange(aes(y = Mean), shape = 2, linetype = 2)
p + geom_pointrange(aes(y = Mean, colour = Month))

# ------------------------------- Рисунок 4.35 ---------------------------------
p <- ggplot(data = dat, aes(x = Month, ymin = Mean - SE, ymax = Mean + SE))
p + geom_point(aes(y = Mean)) + geom_errorbar()
p + geom_point(aes(y = Mean)) + geom_errorbar(width = 0.25)

# ------------------------------- Рисунок 4.36 ---------------------------------
# объект p определен как на рис. 4.35
p + geom_bar(aes(y = Mean, fill = Month), stat = "identity") +
    geom_errorbar(width = 0.25)
q <- ggplot(data = dat, aes(x = Mean, y = Month))
q + geom_point() + geom_errorbarh(aes(xmax = Mean + SE,
                                      xmin = Mean - SE), height = 0.25)

# ------------------------------- Рисунок 4.37 ---------------------------------
# объект p определен как на рис. 4.35
p + geom_crossbar(aes(y = Mean))
p + geom_crossbar(aes(y = Mean, fill = Month), fatten = 5)

# ------------------------------- Рисунок 4.38 ---------------------------------
p <- ggplot(data = dreissena, aes(x = Lake, y = log(Infection+1)))
p + geom_boxplot()
p + geom_boxplot(fill = "coral", color = "blue")

# ------------------------------- Рисунок 4.39 ---------------------------------
# здесь и до рис. 4.42 объект p определен как на рис. 4.38
p + geom_boxplot(size = 1.2)
p + geom_boxplot(outlier.shape = 2, outlier.colour = "blue")


# ------------------------------- Рисунок 4.40 ---------------------------------
p + geom_boxplot(notch = TRUE)
p + geom_boxplot(notch = TRUE, notchwidth = 0.2)

# ------------------------------- Рисунок 4.41 ---------------------------------
# График слева:
p + geom_boxplot()

# График справа:
require(doBy)
quant10 <- function(x) quantile(x, p = 0.10)
quant90 <- function(x) quantile(x, p = 0.90)
stats <- summaryBy(data = dreissena, 
                   log(Infection + 1) ~ Lake,
                   FUN = c(min, max, mean, quant10, quant90))
names(stats) <- c("Lake", "Min", "Max", "Mean", "Q10", "Q90")
q <- ggplot(stats)
q + geom_boxplot(aes(x = Lake, ymin = Min, ymax = Max,
                     lower = Q10, middle = Mean,
                     upper = Q90), stat = "identity") +
    ylab("log(Infection+1)")

# ------------------------------- Рисунок 4.42 ---------------------------------
p + geom_boxplot(aes(fill = Month))

# ------------------------------- Рисунок 4.43 ---------------------------------
p <- ggplot(data = dreissena, aes(x = Lake, y = log(Infection+1)))
p + geom_violin(scale = "area")
p + geom_violin(scale = "count")
p + geom_violin(scale = "width")

# ------------------------------- Рисунок 4.44 ---------------------------------
# здесь и до рис. 4.48 объект p определен как на рис. 4.43
p + geom_violin(trim = TRUE)
p + geom_violin(adjust = 0.4, trim = FALSE)
p + geom_violin(adjust = 0.4, trim = FALSE) +
    coord_flip()

# ------------------------------- Рисунок 4.45 ---------------------------------
p + geom_violin(trim = FALSE, fill = "red")
p + geom_violin(trim = FALSE, fill = "red", colour = "blue")
p + geom_violin(trim = FALSE, fill = "red", alpha = 0.5,
                colour = "blue", size = 1.5)

# ------------------------------- Рисунок 4.46 ---------------------------------
p + geom_violin(trim = FALSE) + geom_point(shape = 19, alpha = 0.2)
p + geom_violin(trim = FALSE) + geom_jitter(shape = 19, alpha = 0.2)

# ------------------------------- Рисунок 4.47 ---------------------------------
p + geom_violin(aes(fill = Month), trim = FALSE)

# ------------------------------- Рисунок 4.48 ---------------------------------
p + geom_violin(aes(fill = Lake), trim = FALSE, alpha = 0.3) +
    geom_boxplot(aes(fill = Lake), width = 0.2, outlier.colour = NA)

