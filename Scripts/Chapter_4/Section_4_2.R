# В этом файле приведены примеры кода из раздела 4.2 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 4.1 ----------------------------------
ggplot(data = subset(dreissena,
                     Lake == "Naroch" & Month == "May"),
       aes(x = Infection)) + geom_dotplot()

# В соответствии с автоматическими настройками
# приведенная выше команда создаст график с осью Y.
# Однако в случае с одномерной точечной диаграммой
# эта ось не имеет смысла. Ее можно отключить при
# помощи функции scale_y_continuous() следующим образом:

ggplot(data = subset(dreissena, Lake == "Naroch" & Month == "May"),
       aes(x = Infection)) + geom_dotplot() +
    scale_y_continuous(name = "", breaks = NULL)


# ------------------------------- Рисунок 4.2 ----------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Naroch" & Month == "May"),
            aes(x = Infection)) + 
    scale_y_continuous(name = "", breaks = NULL)
p + geom_dotplot()
p + geom_dotplot(binwidth = 100)
p + geom_dotplot(binwidth = 250)

# ------------------------------- Рисунок 4.3 ----------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Naroch" & Month == "May"),
            aes(x = Infection)) +
    scale_y_continuous(name = "", breaks = NULL)
p + geom_dotplot(method = "histodot", binwidth = 100)
p + geom_dotplot(method = "histodot", binwidth = 250)

# ------------------------------- Рисунок 4.4 ----------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Batorino" & Month == "May"),
            aes(x = Site, y = Infection))
p + geom_dotplot(binaxis = "y", stackdir = "up",
                 binwidth = 50)
p + geom_dotplot(binaxis = "y", stackdir = "down",
                 binwidth = 50)
p + geom_dotplot(binaxis = "y", stackdir = "center",
                 binwidth = 50)

# ------------------------------- Рисунок 4.5 ----------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Batorino"),
            aes(x = Month, fill = Site, y = Infection))
p + geom_dotplot(binaxis = "y")
p + geom_dotplot(binaxis = "y", position = "dodge")

# ------------------------------- Рисунок 4.6 ----------------------------------
ggplot(data = subset(dreissena, Lake == "Batorino"), aes(Site)) +
    geom_bar()
ggplot(data = subset(dreissena, Lake == "Batorino"), aes(Infection)) + 
    geom_bar()

# ------------------------------- Рисунок 4.7 ----------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Batorino"), aes(x = Site))
p + geom_bar(width = 0.5)
p + geom_bar(width = 0.5) + coord_flip()

# ------------------------------- Рисунок 4.8 ----------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Batorino"), aes(x = Site))
p + geom_bar(fill = "coral", colour = "blue", size = 1.2)
p + geom_bar(fill = "coral", colour = "blue", size = 1.2, linetype = 2)

# ------------------------------- Рисунок 4.9 ----------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Batorino"), aes(x = Site))
p + geom_bar(aes(fill = Month), position = "stack")
p + geom_bar(aes(fill = Month), position = "fill")
p + geom_bar(aes(fill = Month), position = "dodge")

# ------------------------------- Рисунок 4.10 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Naroch" & Month == "May"),
            aes(x = Site))
p + geom_bar()
p + geom_bar(aes(weight = Infection))

# ------------------------------- Рисунок 4.11 ---------------------------------
library(doBy)

# Расчет средних значений интенсивности инвазии
# с сохранением результатов в виде таблицы данных:
meanInfection <- summaryBy(Infection ~ Lake, data = dreissena)

# Точечная диаграмма со средними значениями:
ggplot(data = meanInfection, aes(x = Lake, y = Infection.mean)) + geom_point()

# Столбиковая диаграмма с теми же средними значениями
# (обратите внимание на аргумент stat = "identity"
# функции geom_bar(): он заставляет эту функцию принять
# средние значения "как есть", без выполнения каких-либо
# дополнительных преобразований):
ggplot(data = meanInfection, aes(x = Lake, y = Infection.mean)) +
    geom_bar(stat = "identity")

# ------------------------------- Рисунок 4.12 ---------------------------------
p <- ggplot(data = dreissena, aes(x = Infection))
p + geom_histogram()
p + geom_histogram(binwidth = 50)

# ------------------------------- Рисунок 4.13 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Naroch"), aes(x = Infection))
p + geom_histogram(aes(y = ..density..))
p + geom_histogram(aes(y = ..density..)) +
    geom_density(colour = "magenta")

# ------------------------------- Рисунок 4.14 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Naroch"), aes(x = Infection))
p + geom_histogram(aes(fill = Month))
p + geom_histogram(aes(fill = Month), position = "dodge")

# ------------------------------- Рисунок 4.15 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Batorino"), aes(x = Infection))
p + geom_histogram(binwidth = 500)
p + geom_histogram(binwidth = 500) +
    geom_freqpoly(binwidth = 500, colour = "magenta")

# ------------------------------- Рисунок 4.16 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Batorino"), aes(x = Infection))
p + geom_freqpoly(binwidth = 50, colour = "blue")
p + geom_freqpoly(binwidth = 100, colour = "darkgreen", size = 1.2)

# ------------------------------- Рисунок 4.17 ---------------------------------
# Объект p определен как на рис. 4.16
p + geom_freqpoly(aes(colour = Month), binwidth = 500)
p + geom_freqpoly(aes(y = ..density.., colour = Month), binwidth = 500)

# ------------------------------- Рисунок 4.18 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Batorino"),
            aes(x = log(Infection + 1)))
p + geom_density(kernel = "rectangular")
p + geom_density(kernel = "epanechnikov")
p + geom_density(kernel = "rectangular", adjust = 1/3)
p + geom_density(kernel = "epanechnikov", adjust = 1/3)

# ------------------------------- Рисунок 4.19 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Batorino"),
            aes(x = log(Infection + 1)))
p + geom_density(aes(fill = Month), size = 1.1)
p + geom_density(aes(fill = Month), colour = "blue",
                 linetype = 2, alpha = 0.6)

# ------------------------------- Рисунок 4.20 ---------------------------------
p <- ggplot(data = dreissena, aes(x = log(Infection + 1)))
p + geom_density(aes(group = factor(Day)))
p + geom_density(aes(group = factor(Day), colour = Day))

# ------------------------------- Рисунок 4.22 ---------------------------------
# Для наглядности отсортируем исходную таблицу с данными,
# выбрав только те значение переменной Infection, которые
# лежат в диапазоне от 100 до 200:
dreissena2 <- subset(dreissena, Infection > 100 & Infection < 200)

# Упорядочим значения переменной Infection по возрастанию:
dreissena2 <- dreissena2[order(dreissena2$Infection), ]
p <- ggplot(data = dreissena2, aes(x = 1:nrow(dreissena2), y = Infection))
p + geom_step(direction = "hv") + geom_step(direction = "vh", colour = "blue")
p + geom_step(colour = "red", size = 1.1)

# ------------------------------- Рисунок 4.23 ---------------------------------
p <- ggplot(data = dreissena2,aes(x = Infection))
p + geom_step(stat = "ecdf")
p + geom_step(aes(colour = Lake), stat = "ecdf")

# ------------------------------- Рисунок 4.24 ---------------------------------
p <- ggplot(data = subset(dreissena, Lake == "Batorino" & Month == "May"),
            aes(sample = Infection))
p + stat_qq()
p + stat_qq(aes(colour = Site))

# ------------------------------- Рисунок 4.25 ---------------------------------
# Интенсивность инвазии дрейссены инфузорией C. acuminatus -
# дискретная количественная переменная. Часто для описания
# распределения таких переменных подходят распределение
# Пуассона или негативное биномиальное распределение.
# Проверим, какой из этих двух законов распределения
# вероятностей подходит лучше для данных по озеру Баторино,
# полученных в мае 2005 г.
# Для удобства сохраним данные в виде отдельной таблицы:
dreissena2 <- subset(dreissena, Lake == "Batorino" & Month == "May")

# Оценим параметры теоретических распределений по
# выборочным данным (использована функция fitdistr из
# базового R-пакета MASS):
library(MASS)
params1 <- as.list(fitdistr(dreissena2$Infection,
                            "Negative Binomial")$estimate)
params2 <- as.list(fitdistr(dreissena2$Infection,
                            "Poisson")$estimate)

# Построим квантильные графики:
ggplot(dreissena2, aes(sample = Infection)) +
    stat_qq(distribution = qpois, dparams = params2)
ggplot(dreissena2, aes(sample = Infection)) +
    stat_qq(distribution = qnbinom, dparams = params1)

