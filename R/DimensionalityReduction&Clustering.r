scRNA <- NormalizeData(scRNA) #ScaleData之前要先NormalizeData
scRNA <- ScaleData(scRNA, features = rownames(scRNA))

scRNA <- RunPCA(scRNA, features = VariableFeatures(scRNA))

p2_1 <- DimPlot(scRNA, reduction = "pca", group.by="Patient_ID")+
  labs(tag = "D")

scRNA <- JackStraw(scRNA,reduction = "pca", dims=20)
scRNA <- ScoreJackStraw(scRNA,dims = 1:20)

p2_2 <- JackStrawPlot(scRNA,dims = 1:20, reduction = "pca") +
  theme(legend.position="bottom") +
  labs(tag = "E")
p2_3 <- ElbowPlot(scRNA, ndims=20, reduction="pca") 

pc.num=1:20
scRNA <- FindNeighbors(scRNA, dims = pc.num) 
scRNA <- FindClusters(scRNA, resolution = 0.5)
scRNA = RunTSNE(scRNA, dims = pc.num)
p3_1 <- DimPlot(scRNA, reduction = "tsne",label=T) +
  labs(tag = "E")

scRNA <- NormalizeData(scRNA, normalization.method = "LogNormalize")
diff.wilcox = FindAllMarkers(scRNA)


scRNA <- NormalizeData(scRNA, normalization.method = "LogNormalize")
diff.wilcox = FindAllMarkers(scRNA)