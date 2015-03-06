# Example call:
# stateTax("Maryland", "single", 100000)

stateTaxAlt <-
    function (state, status, wage) {
        
        library(dplyr)
        
        stateTax <- tbl_df(read.csv("stateTax.csv", stringsAsFactors=FALSE))
        stateTax$state <- gsub(" \\(.+\\)", "", stateTax$state, perl=TRUE)
        stateTax$state <- gsub("\\(.+\\)", "", stateTax$state, perl=TRUE)
        
        stateTax_1 <- stateTax[stateTax$state == state,]
        stateTax_2 <- stateTax_1[stateTax_1$type == status,]
        
        if(wage < stateTax_2$bracket[1]){
            return(wage * stateTax_2$rate[1])
        }
        
        cum <- stateTax_2$bracket[1] * stateTax_2$rate[1]
        for(i in 2:length(stateTax_2$bracket)){
            if(wage > stateTax_2$bracket[i]){
                cum <- cum+(stateTax_2$bracket[i]-stateTax_2$bracket[i-1])*
                              stateTax_2$rate[i]
            } else {
                return(cum + (wage - stateTax_2$bracket[i-1]) *
                              stateTax_2$rate[i])
            }
        }      
        
    }

# Calculates local taxes based on the average for the state
# Example call:
# localTax("Maryland", "single", 100000)
localTax <- function (state, status, wage) {
    
    library(dplyr)
    
    localTax <- tbl_df(read.csv("localTax.csv", stringsAsFactors=FALSE))
    localTax$state <- gsub(" \\(.+\\)", "", localTax$state, perl=TRUE)
    localTax$state <- gsub("\\(.+\\)", "", localTax$state, perl=TRUE)
    
    localTax_1 <- localTax[localTax$state == state,]
    localTax_2 <- localTax_1[localTax_1$type == status,]
    
    if(wage < localTax_2$bracket[1]){
        return(wage * localTax_2$rate[1])
    }
    
    cum <- localTax_2$bracket[1] * localTax_2$rate[1]
    for(i in 2:length(localTax_2$bracket)){
        if(wage > localTax_2$bracket[i]){
            cum <- cum+(localTax_2$bracket[i]-localTax_2$bracket[i-1])*
                localTax_2$rate[i]
        } else {
            return(cum + (wage - localTax_2$bracket[i-1]) *
                       localTax_2$rate[i])
        }
    }      
    
}



