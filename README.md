## NHANES anemia data

This package builds the example National Health and Nutritional
Examination Survey (NHANES) dataset containing data about anemia and
iron status from the years on n=3,990 patients from 1999-2000. The file
was created by merging demographic data with complete blood count file,
and nutritional biochemistry lab file.

## Installation

You can install the package from Bitbucket

    library("devtools")
    devtools::install_github("alanbrookhart/anemia")

## Codebook

-   age = age in years of participant (years)
-   sex = sex of participant (Male vs Femal)
-   tsat = transferrin saturation (%)
-   iron = total serum iron (ug/dL)
-   hgb = hemoglobin concentration (g/dL)
-   ferr = serum ferritin (mg/mL)
-   folate = serum folate (mg/mL)
-   race = paricipant race (Hispanic, White, Black, Other)
-   rdw = red cell distribution width (%)
-   wbc = white blood cell count (SI)
-   anemia = indicator variable for anemia (according to WHO definition)

## Notes

805 participants with missing observations are dropped. These can be
recovered using the raw data.

NHANES sampling weights are not included.

## To do

Add documentation to file.
