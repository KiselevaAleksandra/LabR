
data <- read.csv("Payment_and_Value_of_Care-Hospital.csv")

check_name <- function(name) {
  
  check_city <- data[data$City == name, "Facility.ID"]
  check_country <- data[data$Country.Name == name, "Facility.ID"]
  check_state <- data[data$State == name, "Facility.ID"]
  
  check <- NULL
  if(length(check_city)){
    print(paste("City - ",name,": ",length(unique(check_city))))
    check <- check_city
  }
  if(length(check_country)){
    print(paste("Country.Name - ",name,": ",length(unique(check_country))))
    check <- check_country
  }
  if(length(check_state)){
    print(paste("State - ",name,": ",length(unique(check_state))))
    check <- check_state
  }
  if(length(unique(check)) == 0) 
    message("Incorrect place")
  else 
    return(length(unique(check)))
}

print(check_name("FLORENCE"))
print(check_name("MARSHALL"))
print(check_name("AL"))
print(check_name("123"))
