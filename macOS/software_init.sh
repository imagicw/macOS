#!/bin/bash
# ctrl + c 无法中断整个程序的运行

read -r -n1 -p "即将进行软件包的安装，是否继续？[y/n]: " confirm

case $confirm in
  [yY])
    echo '\n开始安装软件包'
    ;;

  *)
    echo '\n退出软件包安装'
    exit 0
    ;;
esac;

echo "正在安装 zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "正在安装 Homebrew..."

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'Homebrew 安装完成！	\n开始安装软件包...'

# 工具类
brew install --cask iterm2
brew install --cask iina
brew install --cask handbrake

# CLI 工具
brew install yt-dlp

# 效率类
# brew install --cask mimestream
brew install --cask notion
brew install --cask visual-studio-code
brew install --cask raycast
brew install --cask input-source-pro

# IM
brew install --cask telegram
brew install --cask discord

# brew install loopback
# brew install audio-hijack
# brew install jq


read -s -n1 -p "即将安装 Mac app store 中的应用，请确保 Apple ID 已经登录。按任意键继续..."

echo "正在安装 mas cli..."
brew install mas

echo 'mas 安装完成！ \n开始安装 mas 软件...'
mas install 1176895641 # Spark

echo "软件安装完成！"

exit 0