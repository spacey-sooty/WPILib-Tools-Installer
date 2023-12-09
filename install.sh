sudo apt install -y openjdk-11-jdk
git clone https://github.com/wpilibsuite/WPILibInstaller-Avalonia.git
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y dotnet-sdk-8.0
sudo apt-get install -y aspnetcore-runtime-8.0
cd WPILibInstaller-Avalonia
./gradlew generateInstallers -PXmx3072m -PlinuxBuild -PjenkinsBuild
mv build/outputs/WPILibInstaller ./WPILibInstaller
./WPILibInstaller
