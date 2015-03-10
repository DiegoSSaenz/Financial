# Example call:
# stateTax("Maryland", "single", 100000)

# stateTaxAlt <-  function (state, status, wage) {
#         
#         library(dplyr)
#         
#         stateTax <- tbl_df(read.csv("stateTax2.csv", stringsAsFactors=FALSE))
#         stateTax$state <- gsub(" \\(.+\\)", "", stateTax$state, perl=TRUE)
#         stateTax$state <- gsub("\\(.+\\)", "", stateTax$state, perl=TRUE)
#         
#         stateTax_1 <- stateTax[stateTax$state == state,]
#         stateTax_2 <- stateTax_1[stateTax_1$type == status,]
#         
#         if(wage < stateTax_2$bracket[1]){
#             return(wage * stateTax_2$rate[1])
#         }
#         
#         cum <- stateTax_2$bracket[1] * stateTax_2$rate[1]
#         for(i in 2:length(stateTax_2$bracket)){
#             if(wage > stateTax_2$bracket[i]){
#                 cum <- cum+(stateTax_2$bracket[i]-stateTax_2$bracket[i-1])*
#                               stateTax_2$rate[i]
#             } else {
#                 return(cum + (wage - stateTax_2$bracket[i-1]) *
#                               stateTax_2$rate[i])
#             }
#         }
# }

stateTaxAlt <- function (name, status, wage) {
    
    library(dplyr)
    
    stateTax <- tbl_df(read.csv("stateTax3.csv", stringsAsFactors=FALSE))
    stateTax$state <- gsub(" \\(.+\\)", "", stateTax$state, perl=TRUE)
    stateTax$state <- gsub("\\(.+\\)", "", stateTax$state, perl=TRUE)
    
    stateTax %>% filter(state==name, type==status) %>%
        mutate(amt=rate*pmin(bracket, pmax(wage-lag(cumBracket),0),na.rm=T)) %>%
        mutate(value=ifelse(is.finite(sum(amt)), sum(amt), wage*rate)) %>%   
        summarise(tax=max(value))
    
}

# returns TRUE if the state has locality taxes and FALSE if the state
# does not
hasLocality <- function(state){
    
    library(dplyr)
    
    localTax <- tbl_df(read.csv("localTax.csv", stringsAsFactors=FALSE))
    localTax$state <- gsub(" \\(.+\\)", "", localTax$state, perl=TRUE)
    localTax$state <- gsub("\\(.+\\)", "", localTax$state, perl=TRUE)
    
    localTax_1 <- localTax[localTax$state == state,]
    
    localTax_1$rate != 0
}

localTax <- function (name, status, loc, wage) {
    
    library(dplyr)
        
    localTax <- tbl_df(read.csv("localities.csv", stringsAsFactors=FALSE))
    localTax$state <- gsub(" \\(.+\\)", "", localTax$state, perl=TRUE)
    localTax$state <- gsub("\\(.+\\)", "", localTax$state, perl=TRUE)
    
    lTax <- localTax %>% filter(state==name, locality==loc)

    return(wage * lTax$rate + lTax$flatFee +
           stateTaxAlt(name, status, wage) * lTax$stateTax) 
    
}

localityList <- function(name){
    
    library(dplyr)
    
    localTax <- tbl_df(read.csv("localities.csv", stringsAsFactors=FALSE))
    localTax$state <- gsub(" \\(.+\\)", "", localTax$state, perl=TRUE)
    localTax$state <- gsub("\\(.+\\)", "", localTax$state, perl=TRUE)
    
    lTax <- localTax %>% filter(state==name)
    lTax$locality
}



