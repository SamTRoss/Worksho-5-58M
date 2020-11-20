library(Rmisc)
library(tidyverse)
library(Rtsne)
library(GGally)

## Import wheat data
wheat_file <- "seeds_dataset.txt"
## Create column names
cols <- c("area", 
          "perimeter",
          "compactness",
          "kernal_length",
          "kernel_width",
          "asymmetry_coef",
          "groove_length",
          "species")
## Add the column names to the dataset
wheat_data <- read_table2(wheat_file, col_names = cols)

## The species is coded as 1, 2, and 3 and 
## it would be useful to recode to the species names:
wheat_data$species <- recode(wheat_data$species,
                        `1` = "Kama",
                        `2` = "Rosa",
                        `3` = "Canadian")

## If you have about 4 - 15 variables,
## plotting them pairwise against each other gives a nice overview. 
## This can be achieved with the `ggpairs()` from the `GGally` package.
wheat_data %>% 
  GGally::ggpairs(aes(color = species)) # Area and Perimeter appear to be the best for identifying

## Perform a PCA on the dataset
pca <- wheat_data %>% 
  select(-species) %>% 
  prcomp(scale. = TRUE)
## To see the varaince of each component
summary(pca)




