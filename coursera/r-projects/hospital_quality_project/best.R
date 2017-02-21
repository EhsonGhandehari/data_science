best<-function (state,disease) {
        
        # loading or installing the necessary packages:
        
        if(!require("magrittr")) {
                message("installing the 'magrittr' package")
                install.packages("magrittr")
                }
        if(!require("dplyr")) {
                message("installing the 'dplyr' package")
                install.packages("dplyr")
                }
        if(!require("plyr")) {
                message("installing the 'plyr' package")
                install.packages("plyr")
                }
        
        # Checking if the the dataset is already loaded:
        # This is what I have so far, I need to change the code when I make a package
        address<-system("find /Users -name hospital_quality_report_EMG.Rmd",
                        intern=TRUE)
        length1<-nchar(address)
        length2<-nchar("hospital_quality_report_EMG.Rmd")+1
        address<-paste0(strtrim(address, length1-length2)[1])
        setwd(address)
        
        load("data.RData")
        
        # Testing the quality and validity/structure of data.
        if (!(toupper(state) %in% state.abb)) { stop("Invalid state.")}
        if (!is.character(disease)) { stop("invalid outcome")}
        if (!(tolower(disease) %in% c("heart attack","heart failure", "pneumonia"))) {
                stop("invalid outcome")
        }
        
        # Selecting the right column from data based on the disease.
        
        disease=tolower(disease)
        if (disease=="heart attack") {i=11
        } else if (disease=="heart failure") {i=17
        } else {i=23}
        
        data<-subset(data, State==state)        
        data<-data.frame(State=data$State,Hospital.Name=data$Hospital.Name,
                         Disease=data[,i])
        minimum=min(data$Disease,na.rm=TRUE)
        result<-subset(data,Disease==minimum)
        arrange(result,Hospital.Name)
        return (as.character(result$Hospital.Name[1]))
}
