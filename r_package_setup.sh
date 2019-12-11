#!/usr/bin/env bash

# Texlive for Latex/knitr
sudo apt -y install texlive
sudo apt -y install texlive-latex-recommended texlive-pictures texlive-latex-extra

# install required python2 and python3 packages
sudo -H pip install markdown rpy2==2.7.1 pelican==3.7.1
sudo -H pip3 install markdown rpy2==2.9.3 pelican==3.7.1

# install java dependencies for R packages for PDF processing
sudo apt -y install libpoppler-cpp-dev r-cran-rjava
sudo R CMD javareconf

# TTF/OTF fonts usage
sudo apt -y install libfreetype6-dev

# Cairo for graphic devices
sudo apt -y install libgtk2.0-dev libxt-dev libcairo2-dev

# Install common packages
R --vanilla << EOF
install.packages(c("tidyverse","data.table","dtplyr","devtools","roxygen2","bit64","readr"), repos = "https://cran.rstudio.com/")
q()
EOF

# Install TDD packages
R --vanilla << EOF
install.packages("testthis")
q()
EOF

# Export to HTML/Excel
R --vanilla << EOF
install.packages(c("htmlTable","openxlsx"), repos = "https://cran.rstudio.com/")
q()
EOF

# Blog tools
R --vanilla << EOF
install.packages(c("knitr","rmarkdown"), repos='http://cran.us.r-project.org')
q()
EOF

# PDF extraction tools
R --vanilla << EOF
library(devtools)
install.packages("pdftools", repos = "https://cran.rstudio.com/")
install_github("ropensci/tabulizer")
q()
EOF

# TTF/OTF fonts usage
R --vanilla << EOF
install.packages("showtext", repos = "https://cran.rstudio.com/")
q()
EOF

# Cairo for graphic devices
R --vanilla << EOF
install.packages("Cairo", repos = "https://cran.rstudio.com/")
q()
EOF

# other tidyverse packages
R --vanilla << EOF
install.packages(c("readxl","haven","jsonlite","xml2","httr","rvest"), repos = "https://cran.rstudio.com/")
q()
EOF

R --vanilla << EOF
install.packages(c("googledrive","glue","lubridate","hms","blob","magrittr"), repos = "https://cran.rstudio.com/")
q()
EOF

R --vanilla << EOF
install.packages(c("DBI","purr"), repos = "https://cran.rstudio.com/")
q()
EOF

# other R packages
R --vanilla << EOF
install.packages(c("corrr","corrplot","janitor","DataExplorer","skimr"), repos = "https://cran.rstudio.com/")
q()
EOF

R --vanilla << EOF
install.packages(c("broom","curl","git2r"), repos = "https://cran.rstudio.com/")
q()
EOF

# BioConductor packages
R --vanilla << EOF
install.packages(c("BiocManager"), repos = "https://cran.rstudio.com/")
q()
EOF

R --vanilla << EOF
library("BiocManager")
BiocManager::install("refGenome")
EOF

# Update all the installed packages
R --vanilla << EOF
update.packages(ask = FALSE, repos = "https://cran.rstudio.com/")
q()
EOF

exit;
