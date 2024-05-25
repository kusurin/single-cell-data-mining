gse112302 <- getGEO('GSE112302',destdir = ".")
class(gse112302)
length(gse112302)

#以下试验，没用

a <- read.table("./GSE112302_RAW/")

a <- read.table("./GSE84465_GBM_All_data.csv.gz")

b <- read.table("./SraRunTable.txt",sep = ",", header = T)

b.group <- b[,c("plate_id","Well","TISSUE","Patient_ID")]
b.group$sample <- paste0("X",b.group$plate_id,".",b.group$Well)
head(b.group)

index <- which(b.group$TISSUE=="Tumor")

a.filt <- a[,index]