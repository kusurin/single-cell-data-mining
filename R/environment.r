cran_pkgs <- c("tidyverse", "ggplot2")
biocductor_pkgs <- c("Seurat","scran","scater","monocle","DropletUtils","SingleR")
for (pkg in cran_pkgs) {
    if(!requireNamespace(pkg,character.only = TRUE))
    #requireNamespace() 只检查包是否存在，不加载
    #character.only = TRUE 使接受字符串变量
    install.packages(pkg,ask = FALSE) #ask 安装中询问
}
if(!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager",ask = FALSE)
for (pkg in biocductor_pkgs) {
    if(!requireNamespace(pkg,character.only = TRUE))
    BiocManager::install(pkg,ask = FALSE)
}
for (pkg in c(cran_pkgs, biocductor_pkgs)) {
    if(!require(pkg,character.only = TRUE)) #require() 加载包
        stop(paste("Package", pkg, "not found"))
}

BiocManager::install("GEOquery",ask = FALSE)