case $1 in
    "ubuntu" | "debian" )
        sudo apt-get update
        wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
        sudo dpkg -i packages-microsoft-prod.deb
        rm packages-microsoft-prod.deb
        sudo apt-get install -y dotnet-sdk-8.0
        sudo apt-get install -y aspnetcore-runtime-8.0
        sudo apt install -y openjdk-11-jdk
        ;;
    "arch" )
        pacman -Syu
        pacman -S --noconfirm jdk11-openjdk
        pacman -S --noconfirm dotnet-sdk
        pacman -S --noconfirm aspnet-runtime
        ;;
    "fedora" )
        sudo dnf update
        sudo dnf install -y dotnet-sdk-8.0
        sudo dnf install -y aspnetcore-runtime-8.0
        sudo dnf install java-11-openjdk
        ;;
    * )
        echo "Unsupported Distro"
        exit 1
        ;;
esac

git clone https://github.com/wpilibsuite/WPILibInstaller-Avalonia.git
cd WPILibInstaller-Avalonia
./gradlew generateInstallers -PXmx3072m -PlinuxBuild -PjenkinsBuild --build-cache
mv build/outputs/WPILibInstaller ./WPILibInstaller
./WPILibInstaller
