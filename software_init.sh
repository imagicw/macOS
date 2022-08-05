#!/bin/bash
echo "正在安装 Homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Homebrew 安装完成！	\n开始安装软件包..."

brew install mimestream --cask
brew install telegram --cask
brew install mas
brew install iina --cask
brew install visual-studio-code --cask
brew install iterm2 --cask
# brew install loopback
# brew install audio-hijack
brew install notion --cask
brew install wechat --cask
brew install discord --cask
# brew install jq

echo "正在安装 mas 软件..."
mas install 1176895641 # Spark

echo "软件安装完成！"