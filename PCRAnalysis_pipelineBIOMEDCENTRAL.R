
#PCR Analysis Pipeline BIOMEDCENTRAL data
#--------------------------------------------------------------------------


#To validate the pcr package method I downloaded a new data set to work on.
library(pcr)
bmcsvAnalysis <- read.csv("C:/Users/James Kelly/Documents/Fun_Data/bmcsv.csv")

#For pcr package, you need a data frame with a column of house keeping gene reads and 
# a column of target gene reads ONLY.
targetGenes<- bmcsvAnalysis[c(1:24),]
refGenes<- bmcsvAnalysis[c(25:48),]
targetGenes$Reference <- refGenes$Ct
targetGenes$Target <- targetGenes$Ct
BIOMEDCENTRAL <- targetGenes[, c(9,8)]

#Note the distribution of grouping variable and generate a factor identical to this
GROUP_VAR <- rep(c('Control', 'Treatment'), each = 12)


res <- pcr_analyze(BIOMEDCENTRAL,
                   group_var = GROUP_VAR,
                   reference_gene = 'Reference',
                   reference_group = 'Control',
                   method = "delta_delta_ct" 
)
                                                                                       
write.csv(res, "C:/Users/James Kelly/Documents/Fun_Data/ pcr_analysis_outptBIOMEDCENTRAL.csv", sep = ",")


