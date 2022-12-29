library(ggplot2)

path = 'data.csv'

process_data <- function(path) {
  data <- read.csv(path, sep=";")
  colnames(data) <- c("breed", "name", "unit", "value")
  subset(data, name == "Площадь земель, занятых лесными насаждениями (покрытых лесной растительностью), всего")
}

plot_pie_chart <- function(data){
  gg <- ggplot(data = data, mapping = aes(x = '', y = value, fill = breed)) + geom_col() + coord_polar(theta = 'y') + xlab("вид породы (цвет)") + ylab("площадь (число)") + ggtitle('Площадь земель, занятых лесными насаждениями (покрытых лесной растительностью), всего.\n\nКруговая диаграмма')
  gg <- gg + guides(fill = guide_legend(title = "вид породы"))
  print(gg)
}

plot_bar_chart <- function(data){
  gg <- ggplot(data = data, mapping = aes(x = breed, y = value, fill = breed)) + geom_col() + coord_flip() + xlab("вид породы") + ylab("площадь") + ggtitle('Площадь земель, занятых лесными насаждениями (покрытых лесной растительностью), всего.\n\nСтолбчатая диаграмма') + geom_text(aes(label = value), vjust = 0, colour = "black")
  gg <- gg + guides( fill = guide_legend(title = "вид породы"))
  print(gg)
}

data <- process_data(path)
data[[4]] <- as.numeric(sub(',', '.', data[[4]]))
plot_pie_chart(data)
#plot_bar_chart(data)



