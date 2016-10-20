# В этом файле приведены примеры кода из 3-й главы книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 3.1 ----------------------------------
p <- ggplot(data = dreissena, aes(x = Infection))
p + layer(geom = "bar", stat = "bin", position = "identity",
          params = list(fill = "blue", binwidth = 100))

# ------------------------------- Рисунок 3.2 ----------------------------------
p <- ggplot(data = dreissena, aes(Lake, Length)) + geom_boxplot()
# Исключим данные по озеру Баторино:
newdata <- dreissena[dreissena$Lake != "Batorino", ]
p %+% newdata

# ------------------------------- Рисунок 3.3 ----------------------------------
ggplot(data = dreissena, aes(Length, Infection)) + geom_point(colour = "blue")
ggplot(data = dreissena, aes(Length, Infection)) + 
    geom_point(aes(colour = "blue"))

# ------------------------------- Рисунок 3.4 ----------------------------------
library(doBy)
# Функция summaryBy() из пакета doBy использована для расчета
# средних значений интенсивности инвазии в каждом озере
# для каждого дня отбора проб:
InfectionMeans <- summaryBy(Infection ~ Lake + Day,
                            data = dreissena)
names(InfectionMeans)[3] <- "Infection"

print(InfectionMeans)

ggplot(data = InfectionMeans, aes(Day, Infection)) + geom_point()

# ------------------------------- Рисунок 3.5 ----------------------------------
ggplot(data = InfectionMeans, aes(Day, Infection)) + geom_line()

# ------------------------------- Рисунок 3.6 ----------------------------------
ggplot(data = InfectionMeans, aes(Day, Infection, group = Lake)) + geom_line()

# ------------------------------- Рисунок 3.7 ----------------------------------
ggplot(data = InfectionMeans, aes(Day, Infection, group = Lake, colour = Lake)) + 
    geom_line()

# ------------------------------- Рисунок 3.8 ----------------------------------
ggplot(dreissena, aes(sample = Infection, colour = Lake)) + stat_qq()

# ------------------------------- Рисунок 3.9 ----------------------------------
# По умолчанию по оси X графика типа "квантиль-квантиль"
# откладываются теоретически ожидаемые квантили нормального 
# распределения, а по оси Y - выборочные наблюдения. 
# Мы можем изменить такое поведение программы и 
# "перевернуть" оси следующим образом:

ggplot(data = dreissena, aes(sample = Infection, colour = Lake)) +
    stat_qq(aes(x = ..sample.., y = ..theoretical..))

