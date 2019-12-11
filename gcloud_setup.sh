#!/usr/bin/env bash

# add the cloud SDK distribution URI as a package source
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# make sure the installation of apt-transport-https
sudo apt -y install apt-transport-https ca-certificates gnupg

# import Google Cloud public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# update the system and install the cloud SDK
sudo apt update
sudo apt -y install google-cloud-sdk

# update additional cloud components
sudo apt -y install kubectl
#sudo apt -y install google-cloud-sdk-app-engine-python
#sudo apt -y install google-cloud-sdk-app-engine-python-extras
#sudo apt -y install google-cloud-sdk-app-engine-java
#sudo apt -y install google-cloud-sdk-app-engine-go
#sudo apt -y install google-cloud-sdk-bigtable-emulator
#sudo apt -y install google-cloud-sdk-cbt
#sudo apt -y install google-cloud-sdk-cloud-build-local
#sudo apt -y install google-cloud-sdk-datalab
#sudo apt -y install google-cloud-sdk-datastore-emulator
#sudo apt -y install google-cloud-sdk-firestore-emulator
#sudo apt -y install google-cloud-sdk-pubsub-emulator

# system cleanup
sudo apt autoremove

exit;
