X_train<-read.csv("X_train.txt",sep="",header=FALSE)
Columns<-read.csv("features.txt",sep="",header=FALSE)
colnames(X_train)<-Columns$V2
sub_train<-read.csv("subject_train.txt",sep="",header=FALSE)
X_train<-cbind(sub_train,X_train)
# Test data

X_test<-read.csv("X_test.txt",sep="",header=FALSE)
colnames(X_test)<-Columns$V2
sub_test<-read.csv("subject_test.txt",sep="",header=FALSE)
X_test<-cbind(sub_test,X_test)


Net<-rbind(X_train,X_test)
Netmean<-grep("mean()",names(Net),value=TRUE,ignore.case=TRUE)
Netstd<-grep("std()",names(Net),value=TRUE,ignore.case=TRUE)
Netmeasure<-union(Netmean,Netstd)
Netmeasure<-union(Netmeasure,"V1")
NetSub1<-Net[,names(Net)%in%Netmeasure]
write.table(NetSub1,"Tidy.txt",row.name=FALSE)
