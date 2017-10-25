set -ex 

brew install kubernetes-cli
brew install bash-completion
# kubectl completion bash > $(brew --prefix)/etc/bash_completion.d/kubectl
brew install kubernetes-helm
helm init
helm repo add testing http://storage.googleapis.com/kubernetes-charts-testing

helm repo update

#remove docker toolbox
cd $TMPDIR
rm -f uninstall.sh
curl https://raw.githubusercontent.com/docker/toolbox/master/osx/uninstall.sh > uninstall.sh
sudo sh uninstall.sh

# #brew update
# brew install --HEAD xhyve
# brew install docker-machine-driver-xhyve
# sudo chown root:wheel $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
# sudo chmod u+s $(brew --prefix)/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

#install virtualbox
#sh /Volumes/VirtualBox/VirtualBox_Uninstall.tool
cd $TMPDIR
rm -f VirtualBox.dmg
curl http://download.virtualbox.org/virtualbox/5.1.28/VirtualBox-5.1.28-117968-OSX.dmg > VirtualBox.dmg
hdiutil attach VirtualBox.dmg
sudo installer -pkg /Volumes/VirtualBox/VirtualBox.pkg -target /Volumes/Macintosh\ HD
export vbextname='Oracle_VM_VirtualBox_Extension_Pack-5.1.28-117968.vbox-extpack'
rm -f $vbextname
curl http://download.virtualbox.org/virtualbox/5.1.28/$vbextname > $vbextname
VBoxManage extpack install --replace  $vbextname


#COULD NOT GET TO WORK
# #install tools to get minikube to work in docker env in osx
# brew install socat

# rm -f /usr/local/bin/kid
# curl https://raw.githubusercontent.com/vyshane/kid/master/kid > /usr/local/bin/kid
# chmod +x /usr/local/bin/kid
# kid up

#install minikube
sudo rm -rf ~/.minikube/
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.22.3/minikube-darwin-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

# minikube start --container-runtime=docker --v=10 --alsologtostder
minikube start --v=10 --alsologtostderr
eval $(minikube docker-env)

pip3 install kubernetes

minikube dashboard


# kubectl config use-context minikube