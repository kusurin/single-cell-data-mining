gse112302 <- getGEO("GSE112302", destdir = ".")
class(gse112302)
length(gse112302)

a <- read.table("./GSE112302_RAW/")

a <- read.table("./GSE84465_GBM_All_data.csv.gz")
b <- read.table("./SraRunTable.txt", sep = ",", header = T)

b.group <- b[, c("plate_id", "Well", "TISSUE", "Patient_ID")]
b.group$sample <- paste0("X", b.group$plate_id, ".", b.group$Well)
head(b.group)

group <- b.group[index, ] # 筛选的是行
head(group)

index <- which(b.group$tissue == "Tumor")

a.filt <- a[, index]