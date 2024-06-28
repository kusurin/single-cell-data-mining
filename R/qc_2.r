g2m_genes = cc.genes$g2m.genes
g2m_genes = CaseMatch(search = g2m_genes, match = rownames(scRNA))
s_genes = cc.genes$s.genes
s_genes = CaseMatch(search = s_genes, match = rownames(scRNA))
scRNA <- CellCycleScoring(object=scRNA,  g2m.features=g2m_genes,  s.features=s_genes)
head(scRNA@meta.data)

scRNA <- RunPCA(scRNA, features = c(s_genes, g2m_genes))
p1 <- DimPlot(scRNA, reduction = "pca", group.by = "Phase")