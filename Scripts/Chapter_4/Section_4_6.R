# В этом файле приведены примеры кода из раздела 4.6 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 4.59 ---------------------------------
p <- ggplot(data = economics, aes(x = date, y = unemploy)) +
    xlab("Дата") + ylab("Численность, тыс.")
p + geom_line()
p + geom_line(colour = "blue", size = 1)

# ------------------------------- Рисунок 4.60 ---------------------------------
econ <- economics # копия исходной таблицы

# добавим новую переменную - год проведения исследования:
econ$year <- 1900 + as.POSIXlt(economics$date)$year

# добавим новую переменную - месяц (внимание: в R
# по умолчанию январь имеет порядковый номер 0):
econ$month <- as.POSIXlt(economics$date)$mon

# Построение графиков:
p <- ggplot(data = econ, aes(x = month, y = unemploy, group = factor(year))) +
    xlab("Месяц") + ylab("Численность, тыс.")

# Использование переменной year в качестве фактора
# (функция theme() использована для отключения легенды;
# подробнее эта функция будет рассмотрена в главe 8):
p + geom_line(aes(colour = factor(year))) +
    theme(legend.position = "NA")

# year как количественная переменная:
p + geom_line(aes(colour = year))

# ------------------------------- Рисунок 4.61 ---------------------------------
p <- ggplot(data = economics, aes(x = date, ymax = unemploy + 1000,
                                  ymin = unemploy - 1000)) +
    xlab("Дата") + ylab("Численность, тыс.")
p + geom_ribbon()
p + geom_ribbon(fill = "lightblue", colour = "blue", linetype = 3)
p + geom_ribbon(fill = "orange", colour = "red", size = 1) + 
    geom_line(aes(y = unemploy))

