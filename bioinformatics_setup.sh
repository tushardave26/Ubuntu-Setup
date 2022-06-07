#!/usr/bin/env bash

# update and upgrade the Ubuntu
sudo apt -y full-upgrade

# install HTSLIB v1.15.1
cd /usr/local/bin || exit
sudo wget https://github.com/samtools/htslib/releases/download/1.15.1/htslib-1.15.1.tar.bz2
sudo tar -vxjf htslib-1.15.1.tar.bz2
cd htslib-1.15.1 || exit
sudo make
cd ..
sudo rm htslib-1.15.1.tar.bz2

# install SAMTOOLS v1.15.1
sudo wget https://github.com/samtools/samtools/releases/download/1.15.1/samtools-1.15.1.tar.bz2
sudo tar -vxjf samtools-1.15.1.tar.bz2
cd samtools-1.15.1 || exit
sudo make
cd ..
sudo rm samtools-1.15.1.tar.bz2

# install BCFTOOLS v1.15.1
sudo wget https://github.com/samtools/bcftools/releases/download/1.15.1/bcftools-1.15.1.tar.bz2
sudo tar -vxjf bcftools-1.15.1.tar.bz2
cd bcftools-1.15.1 || exit
sudo make
cd ..
sudo rm bcftools-1.15.1.tar.bz2

# install bedtools v2.30.0
sudo wget https://github.com/arq5x/bedtools2/releases/download/v2.30.0/bedtools-2.30.0.tar.gz
sudo tar -zxvf bedtools-2.30.0.tar.gz
cd bedtools2 || exit
sudo make
cd ..
sudo rm bedtools-2.30.0.tar.gz

# add newly installed packages to the path
#echo "# Path for SAMTOOLS, HTSLIB and BCFTOOLS v1.15.1" >> ~/.bashrc
#echo 'export PATH=$PATH:/usr/bin/bcftools-1.15.1' >> ~/.bashrc
#echo 'export PATH=$PATH:/usr/bin/samools-1.15.1' >> ~/.bashrc
#echo 'export PATH=$PATH:/usr/bin/htslib-1.15.1' >> ~/.bashrc
#echo "" >> ~/.bashrc

#echo "# Path for BEDTOOLS v2.30.0" >> ~/.bashrc
#echo 'export PATH=$PATH:/usr/bin/bedtools2/bin' >> ~/.bashrc
#echo "" >> ~/.bashrc

# system cleanup
sudo apt autoremove

exit;
