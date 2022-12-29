library(dplyr)
library(tibble)
library(ggplot2)
load('trades.RData')

table <- tibble(Reduce(function(...) merge(..., all=TRUE), trades)) %>% group_by(time)
table <- table %>% select(-geo)
table[table$indic_et %in% c('Exports in million of ECU/EURO', 'Imports in million of ECU/EURO'), ]

export <- table %>% filter(indic_et=='Exports in million of ECU/EURO')
import <- table %>% filter(indic_et=='Imports in million of ECU/EURO')

exp <- aggregate(export$values, by=list(export$sitc06, export$time), sum)
imp <- aggregate(import$values, by=list(export$sitc06, export$time), sum)
colnames(exp) <- c("Group", "Time", "Value")
colnames(imp) <- c("Group", "Time", "Value")

plot_exp <- ggplot(exp, aes(Time, Value, colour = Group)) + geom_point() + geom_line() + geom_label(size = 3, vjust = 1, aes(label=Value), colour = 'black') + ggtitle("Объемы экспорта по годам") + xlab("Год") + ylab("Объем экспорта") + theme(text = element_text(size=14), axis.text.x = element_text(angle=90, hjust=1))
plot_imp <- ggplot(imp, aes(Time, Value, colour = Group, label=Value))  + geom_point() + geom_line() +  geom_label(size = 3, vjust = 1, aes(label=Value), colour = 'black') + ggtitle("Объемы импорта по годам") + xlab("Год") + ylab("Объем импорта") + theme(text = element_text(size=14), axis.text.x = element_text(angle=90, hjust=1))
plot_imp
plot_exp
