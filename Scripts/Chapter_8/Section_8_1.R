# В этом файле приведены примеры кода из раздела 8.1 книги
# Мастицкий С. Э. (2016) Визуализация данных с помощью ggplot2. - М.: ДМК Пресс
# Во всех примерах предполагается, что пакет ggplot2 уже загружен с помощью
# команды library(ggplot2), а таблица dreissena находится в рабочей среде R
# (см. разд. 1.4)


# ------------------------------- Рисунок 8.1 ----------------------------------
p <- ggplot(data = dreissena, aes(Length, sqrt(Infection))) +
    geom_point(alpha = 0.5)
p + theme_gray() + ggtitle("theme_gray()")
p + theme_bw() + ggtitle("theme_bw()")
p + theme_light() + ggtitle("theme_light()")
p + theme_linedraw() + ggtitle("theme_linedraw()")
p + theme_minimal() + ggtitle("theme_minimal()")
p + theme_classic() + ggtitle("theme_classic()")

# ------------------------------- Рисунок 8.2 ----------------------------------
p <- ggplot(data = dplyr::filter(dreissena, Lake == "Naroch" & Site == "S9"),
            aes(Length, sqrt(Infection))) + geom_point(size = 3)
p + theme(panel.border =
              element_rect(size = 2, colour = "red"))
p + theme(panel.border =
              element_rect(fill = NA, size = 2, colour = "red"))

# ------------------------------- Рисунок 8.3 ----------------------------------
# Объект p определен как на рис. 8.2
p + theme(panel.background =
              element_rect(fill = "lightblue", color = "red", size = 2))
p + geom_point(color = "yellow", size = 3) +
    theme(panel.background =
              element_rect(fill = "black", color = "gray50"),
          panel.grid.major =
              element_line(color = "gray30", size = 2),
          panel.grid.minor =
              element_line(linetype = 2, color = "gray30", size = 1))

# ------------------------------- Рисунок 8.4 ----------------------------------
# Объект p определен как на рис. 8.2
pp <- p + theme_minimal() + labs(title = "Заголовок графика",
         x = "Подпись оси X", y = "Подпись оси Y")
pp + theme(plot.title =
               element_text(size = rel(2), colour = "blue"),
           axis.title.x =
               element_text(size = 14, color = "red"),
           axis.title.y =
               element_text(size = 18, color = "green"))

# ------------------------------- Рисунок 8.5 ----------------------------------
(bp <- ggplot(data = dreissena, aes(Lake, Length, fill = Month)) +
     geom_boxplot() )
bp + theme(legend.position = "top")

# ------------------------------- Рисунок 8.6 ----------------------------------
# Объект bp определен как на рис. 8.5
bpp <- bp + scale_fill_discrete(name = "Месяц:",
                                labels = c("Май", "Июль", "Сентябрь"))
bpp + theme(legend.title =
                element_text(size = 18, colour = "blue"),
            legend.text = element_text(size = 14, colour = "red"))

# ------------------------------- Рисунок 8.7 ----------------------------------
# Объект bpp определен как на рис. 8.6
bpp + theme(legend.background =
                element_rect(colour = "darkblue", size = 2,
                             fill = "lightblue"))
bpp + theme(legend.background =
                element_rect(colour = "darkblue", size = 2,
                             fill = "lightblue"), legend.margin = unit(1, "cm"))

# ------------------------------- Рисунок 8.8 ----------------------------------
# Объект bpp определен как на рис. 8.6
bpp + theme(legend.key = element_blank(),
            legend.key.size = unit(2, "cm"))

# ------------------------------- Рисунок 8.9 ----------------------------------
ggplot(data = dreissena, aes(Lake, Length)) +
    geom_boxplot() + facet_wrap(~Month) +
    theme(strip.background =
              element_rect(fill = "darkblue",
                           colour = "yellow", size = 1),
          strip.text = element_text(colour = "white",
                           size = rel(2), face = 3))


# ------------------------------- Рисунок 8.10 ---------------------------------
science_theme <-
    theme(axis.line.x =
              element_line(size = 1, color = "black"),
          axis.line.y =
              element_line(size = 1, color = "black"),
          axis.title =
              element_text(size = rel(1.5), face = "bold"),
          axis.text =
              element_text(size = rel(1.2), color = "black"),
          axis.ticks =
              element_line(colour = "black"),
          panel.background =
              element_rect(fill = "white", colour = NA),
          panel.border =
              element_rect(fill = NA, colour = NA),
          panel.grid.major =
              element_line(colour = "grey80", size = 0.5),
          panel.grid.minor = element_blank(),
          legend.title =
              element_text(face = "bold", size = rel(1.2)),
          legend.text = element_text(size = rel(1.2)),
          legend.key.size = unit(0.8, "cm"),
          legend.key = element_blank(),
          legend.position = "bottom",
          legend.margin = unit(0.5, "cm")
    )

qplot(x = Lake, y = Length, data = dreissena, fill = Month, geom = "boxplot") +
    science_theme
qplot(x = Length, y = sqrt(Infection),
      data = dreissena, geom = "point",
      colour = Lake) + science_theme


# ------------------------------- Рисунок 8.11 ---------------------------------
library(ggthemes)
p <- qplot(x = Length, y = sqrt(Infection),
           data = dreissena, geom = "point",
           colour = Lake)
p + theme_tufte() + ggtitle("theme_tufte()")
p + theme_economist() + scale_colour_economist() +
    ggtitle("theme_economist()")
p + theme_solarized() + scale_colour_solarized("blue") +
    ggtitle("theme_solarized()")
p + theme_stata() + scale_colour_stata() +
    ggtitle("theme_stata()")
p + theme_excel() + scale_colour_excel() +
    ggtitle("theme_excel()")
p + theme_fivethirtyeight() +
    scale_color_fivethirtyeight() +
    ggtitle("theme_fivethirtyeight()")


# ------------------------------- Рисунок 8.12 ---------------------------------
library(ggthemr)
p <- ggplot(dreissena, aes(Length, fill = Lake)) + geom_histogram()

ggthemr(palette = "flat")
p + ggtitle('pallete = "flat"') +
    theme(legend.position = "NA")

ggthemr(palette = "flat dark")
p + ggtitle('pallete = "flat dark"') +
    theme(legend.position = "NA")

ggthemr(palette = "camoflauge")
p + ggtitle('pallete = "camoflauge"') +
    theme(legend.position = "NA")

ggthemr(palette = "chalk")
p + ggtitle('pallete = "chalk"') +
    theme(legend.position = "NA")

ggthemr(palette = "fresh")
p + ggtitle('pallete = "fresh"') +
    theme(legend.position = "NA")

ggthemr(palette = "sea")
p + ggtitle('pallete = "sea"') +
    theme(legend.position = "NA")

ggthemr_reset() # отмена действия ggthemr()

# ------------------------------- Рисунок 8.13 ---------------------------------
# Объект p определен как на рис. 8.12
ggthemr(palette = "grape", type = "inner")
p + theme(legend.position = "NA")
ggthemr(palette = "grape", type = "outer")
p + theme(legend.position = "NA")
ggthemr(palette = "grape", type = "outer", spacing = 4)
p + theme(legend.position = "NA")
