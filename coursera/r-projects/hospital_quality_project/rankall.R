rankall<-function (disease,rank="best") {
        
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
        
        if (tolower(rank)=="best") {rank=1L}
        
        
        data<-data.frame(Hospital.Name=data$Hospital.Name,
                         State=data$State,Disease=data[,i])
        data<-subset(data,is.na(Disease)==FALSE)
        
        result<-arrange(data,State,Disease,Hospital.Name)
        result2<-data.frame() 
        states_ordered=sort(unique(data$State))
        for (sname in states_ordered) {
                piece<-subset(result,State==sname)
                if (tolower(rank)=="worst") {rank=nrow(piece)}
                result2[sname,1]<-as.character(piece$Hospital.Name)[rank]
                result2[sname,2]<-sname
        }
        colnames(result2)<-c("hospital","state")
        return (result2)
}