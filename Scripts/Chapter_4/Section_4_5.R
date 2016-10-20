# В этом файле приведены примеры кода из раздела 4.5 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 4.49 ---------------------------------
p <- ggplot(data = dreissena, aes(x = Length, y = log(Infection + 1)))
p + geom_point()
p + geom_point(shape = 22, size = 4, fill = "pink")
p + geom_point(shape = 15, size = 3, colour = "blue", alpha = 0.2)

# ------------------------------- Рисунок 4.50 ---------------------------------
# здесь и до рис. 4.54 объект p определен как на рис. 4.49
p + geom_point(aes(colour = Lake))
p + geom_point(aes(size = Day), colour = "tomato", alpha = 0.3)

# ------------------------------- Рисунок 4.51 ---------------------------------
p + geom_point(aes(colour = Day))
p + geom_point(colour = "gray30", size = 3.5) + geom_point(aes(colour = Day))

# ------------------------------- Рисунок 4.52 ---------------------------------
p + geom_point(alpha = 1/2) + geom_smooth()
p + geom_point(alpha = 1/2) + geom_smooth(method = "lm")
p + geom_point(alpha = 1/2) + geom_smooth(method = "lm", se = FALSE)

# ------------------------------- Рисунок 4.53 ---------------------------------
library(mgcv); library(splines); library(MASS)
p + geom_smooth(method = "gam", formula = y ~ s(x, bs = "cs"))
p + geom_smooth(method = "lm", formula = y ~ poly(x, 2))
p + geom_smooth(method = "rlm", formula = y ~ ns(x, 3))

# ------------------------------- Рисунок 4.54 ---------------------------------
p + geom_smooth(fill = "yellow")
p + geom_smooth(fill = "blue", colour = "red", alpha = 0.2)
p + geom_smooth(fill = "skyblue", colour = "darkblue", linetype = 2, size = 2)

# ------------------------------- Рисунок 4.55 ---------------------------------
p <- ggplot(data = dreissena, aes(x = Length,
                                  y = log(Infection + 1), colour = Lake))
p + geom_smooth(aes(fill = Lake), alpha = 0.2, size = 2)

# ------------------------------- Рисунок 4.56 ---------------------------------
library(quantreg) # для функции rq()
library(splines) # для функции ns()
p <- ggplot(data = dreissena, aes(x = Length, y = log(Infection + 1))) +
    geom_point(alpha = 0.2)
p + geom_quantile()
p + geom_quantile(formula = y ~ poly(x, 2))
p + geom_quantile(formula = y ~ ns(x, 3))

# ------------------------------- Рисунок 4.57 ---------------------------------
# здесь и до рис. 4.58 объект р определен как на рис. 4.56
p + geom_quantile(formula = y ~ x, quantiles = c(0.5), size = 1) +
    geom_smooth(method = "lm", colour = "red", size = 1, se = FALSE)
p + geom_quantile(formula = y ~ ns(x, 3), colour = "red",
                  quantiles = c(0.025, 0.5, 0.975))
p + geom_quantile(formula = y ~ ns(x, 3), colour = "magenta",
                  linetype = 2, size = 1, quantiles = c(0.025, 0.5, 0.975))

# ------------------------------- Рисунок 4.58 ---------------------------------
p + aes(colour = Lake) + geom_quantile(formula = y ~ ns(x, 3),
                                       quantiles = c(0.5), size = 1)
p + geom_quantile(aes(colour = ..quantile..), formula = y ~ ns(x, 3),
    quantiles = seq(0.05, 0.95, by = 0.05) )
