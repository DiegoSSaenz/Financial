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

# Example call:
#
# stateTax("Maryland", "single", 100000)