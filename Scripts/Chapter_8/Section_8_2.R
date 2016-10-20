# В этом файле приведены примеры кода из раздела 8.2 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 8.14 ---------------------------------
t1 <- dplyr::filter(dreissena, Lake == "Naroch")
t2 <- dplyr::filter(dreissena, Lake == "Batorino")

par(mfrow = c(1, 2))
plot(t1$Length, sqrt(t1$Infection), main = "Lake Naroch",
     xlab = "Length", ylab = "sqrt(Infection)")
plot(t2$Length, sqrt(t2$Infection), main = "Lake Batorino",
     xlab = "Length", ylab = "sqrt(Infection)")

# ------------------------------- Рисунок 8.15 ---------------------------------
tab <- rbind(t1, t2)
tab$Lake <- relevel(tab$Lake, ref = "Naroch")
qplot(data = tab, x = Length, y = sqrt(Infection),
      geom = "point", facets = ~ Lake)

# ------------------------------- Рисунок 8.16 ---------------------------------
library(grid)
a <- qplot(data = t1, x = Length, y = sqrt(Infection),
           geom = c("point"), main = "Lake Naroch")
b <- qplot(data = t2, x = Length, fill = Month,
           geom = c("histogram"), main = "Lake Batorino")
c <- qplot(data = rbind(t1, t2), x = Month, y = Length,
           fill = Lake, geom = "boxplot", main = "Both lakes")

parentvp <- viewport(layout = grid.layout(2, 2))
pushViewport(parentvp)

print(a, vp = viewport(layout.pos.row = 1,
                       layout.pos.col = c(1:2)))
print(b, vp = viewport(layout.pos.row = 2,
                       layout.pos.col = 1))
print(c, vp = viewport(layout.pos.row = 2,
                       layout.pos.col = 2))

# ------------------------------- Рисунок 8.17 ---------------------------------
# объекты а и с определены как на рис. 8.16
subplotvp <- viewport(width = 0.35, height = 0.35, x = 0.65, y = 0.25)
c; print(a + theme_gray(base_size = 9), vp = subplotvp)

# ------------------------------- Рисунок 8.18 ---------------------------------
# объекты а, b и с определены как на рис. 8.16
library(gridExtra)
grid.arrange(a, b, c, ncol = 2)

# ------------------------------- Рисунок 8.19 ---------------------------------
mod <- lm(Length ~ Lake * Month, data = rbind(t1, t2))
grid.table(round(anova(mod), 3))

# ------------------------------- Рисунок 8.20 ---------------------------------
# Объект mod определен как на рис. 8.19, # а объект c - как на рис. 8.16
tab <- tableGrob(round(anova(mod), 3))
grid.arrange(c, tab, ncol = 1)

