sce.meta <- data.frame(
    Patient_ID = group$Patient_ID, # nolint: object_name_linter.
    row.names = group$sample
)

scRNA <- CreateSeuratObject(
    counts = a.filt,
    meta.data = sce.meta,
    min.cells = 3,
    min.features = 50
)

scRNA[["percent.mt"]] <- PercentageFeatureSet(scRNA, pattern = "^MT-")
scRNA <- subset(scRNA, subset = percent.mt < 5)

scRNA[["percent.ERCC"]] <- PercentageFeatureSet(scRNA, pattern = "^ERCC-")
scRNA <- subset(scRNA, subset = percent.ERCC < 40)

col.num <- length(unique(scRNA@meta.data$Patient_ID))

p1_1.1 <- VlnPlot(scRNA,
    features = c("nFeature_RNA"),
    group.by = "Patient_ID",
    cols = rainbow(col.num)
) +
    theme(legend.position = "none") +
    labs(tag = "A")

p1_1.2 <- VlnPlot(scRNA,
    features = c("nCount_RNA"),
    group.by = "Patient_ID",
    cols = rainbow(col.num)
) +
    theme(legend.position = "none")

p1_1 <- p1_1.1 | p1_1.2

p1_2 <- FeatureScatter(scRNA,
    feature1 = "nCount_RNA", feature2 = "nFeature_RNA",
    group.by = "Patient_ID", pt.size = 1.3
) +
    labs(tag = "B")
