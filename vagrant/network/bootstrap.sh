# Install dependencies
apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    git
# Install NodeJS
curl -sL https://deb.nodesource.com/setup_8.x | bash -
apt install -y nodejs build-essential