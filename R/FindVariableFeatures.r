scRNA <- FindVariableFeatures(scRNA, selection.method = "vst", nfeatures = 1500) 

p1_3 <- LabelPoints(plot = plot1, points = head(VariableFeatures(scRNA), 10) , repel = TRUE, size=2.5) +
  theme(legend.position = c(0.1,0.8)) +
  labs(tag = "C")