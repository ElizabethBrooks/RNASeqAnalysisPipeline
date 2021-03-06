#!/usr/bin/env Rscript
#Usage: Rscript exactTest_vennDiagram.r mergedGeneIDsFile
#Usage Ex: Rscript exactTest_vennDiagram.r mergedGeneIDs.csv
#R script to generate venn diagrams using gene IDs
# from edgeR exact test top tags

#install.packages('VennDiagram')
library(VennDiagram)

#Import data
tags <- read.csv(file=args[1])
#Define sets for diagram
SET1 <- tags$Y05
SET2 <- tags$Y023
SET3 <- tags$E05
SET4 <- tags$R2
SET5 <- tags$PA
SET6 <- tags$Sierra
#Replace NAs
SET1[is.na(SET1)] <- ""
SET2[is.na(SET2)] <- ""
SET3[is.na(SET3)] <- ""
SET4[is.na(SET4)] <- ""
SET5[is.na(SET5)] <- ""
SET6[is.na(SET6)] <- ""

#Draw the diagram from the Olympics sets
v1 <- venn.diagram(list(Y05=SET1, E05=SET3, Y023=SET2, R2=SET4),
                   fill = c("red", "green", "white", "blue"),
                   alpha = c(0.5, 0.5, 0.5, 0.5), cat.cex = 1.5, cex=1.5,
                   filename=NULL)
jpeg("/home/mae/Documents/RNASeq_Workshop_ND/Genetags_Stats/plotOlympicsVennn.jpg")
grid.newpage()
grid.draw(v1)
dev.off()

#Draw the diagram comparing the Olympics and PA sets
v2 <- venn.diagram(list(Y05=SET1, E05=SET3, Y023=SET2, R2=SET4, PA=SET5),
                   fill = c("red", "green", "white", "blue", "yellow"),
                   alpha = c(0.5, 0.5, 0.5, 0.5, 0.5),
                   filename=NULL)
jpeg("/home/mae/Documents/RNASeq_Workshop_ND/Genetags_Stats/plotOlympicsPAVennn.jpg")
grid.newpage()
grid.draw(v2)
dev.off()

#Draw the diagram comparing the Olympics and Sierra sets
v3 <- venn.diagram(list(Y05=SET1, E05=SET3, Y023=SET2, R2=SET4, Sierra=SET6),
                   fill = c("red", "green", "white", "blue", "yellow"),
                   alpha = c(0.5, 0.5, 0.5, 0.5, 0.5),
                   filename=NULL)
jpeg("/home/mae/Documents/RNASeq_Workshop_ND/Genetags_Stats/plotOlympicsSierraVennn.jpg")
grid.newpage()
grid.draw(v3)
dev.off()

#Draw the diagram comparing the tolerant sets
v4 <- venn.diagram(list(Y05=SET1, E05=SET3, Sierra=SET6),
                   fill = c("red", "green","blue"),
                   alpha = c(0.5, 0.5, 0.5), cat.cex = 1.5, cex=1.5,
                   filename=NULL)
jpeg("/home/mae/Documents/RNASeq_Workshop_ND/Genetags_Stats/plotTolerantVenn.jpg")
grid.newpage()
grid.draw(v4)
dev.off()

#Draw the diagram comparing the non-tolerant sets
v5 <- venn.diagram(list(Y023=SET2, R2=SET4, PA=SET5),
                   fill = c("red", "green","blue"),
                   alpha = c(0.5, 0.5, 0.5), cat.cex = 1.5, cex=1.5,
                   filename=NULL)
jpeg("/home/mae/Documents/RNASeq_Workshop_ND/Genetags_Stats/plotNonTolerantVennn.jpg")
grid.newpage()
grid.draw(v5)
dev.off()


#Draw the diagram comparing the Olympic tolerant sets
v6 <- venn.diagram(list(Y05=SET1, E05=SET3),
                   fill = c("red","blue"),
                   alpha = c(0.5, 0.5), cat.cex = 1.5, cex=1.5,
                   filename=NULL)
jpeg("/home/mae/Documents/RNASeq_Workshop_ND/Genetags_Stats/plotOlympicTolerantVenn.jpg")
grid.newpage()
grid.draw(v6)
dev.off()

#Draw the diagram comparing the Olympic non-tolerant sets
v7 <- venn.diagram(list(Y023=SET2, R2=SET4),
                   fill = c("red","blue"),
                   alpha = c(0.5, 0.5), cat.cex = 1.5, cex=1.5,
                   filename=NULL)
jpeg("/home/mae/Documents/RNASeq_Workshop_ND/Genetags_Stats/plotOlympicNonTolerantVennn.jpg")
grid.newpage()
grid.draw(v7)
dev.off()
