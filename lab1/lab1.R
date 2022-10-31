# task 1

df <- read.csv('lab1_e1.csv')

fix_data <- function(df){
  delete_space <- function(df){
    res <- as.numeric(gsub(" ", "", df))
    if (any(is.na(res))){
      return(df)
    }
    return(res)
  }
  fix_df <- data.frame(sapply(df, delete_space))
}

getwd()
fix_df <- fix_data(df)
print(fix_df)


# task 2

load('lab1_e2.RData')

get_id <- function(all_data){
  new_data <- na.omit(Reduce(function(x, y) merge(x, y, by = 'id'), all_data))
  means <- rowMeans(new_data[, -c(1)])
  mean_temp <- data.frame(id = new_data $ id, mean_temp = means)
}

getwd()
data <- get_id(all_data)
print(data)
