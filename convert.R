
# https://botflo.com/convert-csv-file-to-dialogflow-agent-zip-file/



#install.packages("tidyverse")
library(tidyverse)

setwd("~/Dropbox/Coinmerce/convert-csv-google-dialogflow")



# read current faq csv file
current_faq <- read.csv( "FAQ WaterMelon EN.csv", stringsAsFactors = TRUE)



# array of right format for google dialogflow and add column names
faq_google <- data.frame(matrix(ncol=4, nrow=0))



# read rows current faq and set to faq google

i <- 1
for (i in 1:nrow(current_faq)) {
  
  
  # store each row of current faq in array
  
  sub_arr = c(toString(current_faq$a[i]), toString(current_faq$Question.1[i]), 
          toString(current_faq$Question.2[i]), toString(current_faq$Question.3[i]),
          toString(current_faq$Question.4[i]), toString(current_faq$Antwoord[i]))
  
  
  
  
  
  # count questions for each intention and add to faq google
  
    if (sub_arr[2] != "") {
      new_line <- data.frame(i, sub_arr[1], sub_arr[2], sub_arr[6])
      
      faq_google <- data.frame(rbind(as.matrix(faq_google), as.matrix(new_line)))
    }
    
    if (sub_arr[3] != "") {
      new_line <- data.frame(i, "", sub_arr[3], sub_arr[6])
      
      faq_google <- data.frame(rbind(as.matrix(faq_google), as.matrix(new_line)))
    }
    
    if (sub_arr[4] != "") {
      new_line <- data.frame(i, "", sub_arr[4], sub_arr[6])
      
      faq_google <- data.frame(rbind(as.matrix(faq_google), as.matrix(new_line)))
    }
      
    if (sub_arr[5] != "") {
      new_line <- data.frame(i, "", sub_arr[5], sub_arr[6])
      
      faq_google <- data.frame(rbind(as.matrix(faq_google), as.matrix(new_line)))
    }
  
}



# set column names
columns <- c("IntentID", "IntentName", "Query", "Response")
colnames(faq_google) <- columns




#save dataframe as csv 

write.csv(faq_google, "FAQ google.csv", row.names = FALSE)


