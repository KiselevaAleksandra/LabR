
max_dif <- function(day, temp) {
   n <- 1
   dif <- abs(temp[n] - temp[n + 1])
   for (i in 2 : length(temp)-1) {
     tmp <- abs(temp[i] - temp[i + 1])
     if (tmp > dif) {
        dif <- tmp
        n <- i
     }
   }
   c(day[n], day[n + 1], dif)
}

data <- read.csv("RH_T.csv")
day <- unlist(data["YYYYMMDD"])
temp <- unlist(data["T2M"])
print(max_dif(day, temp))