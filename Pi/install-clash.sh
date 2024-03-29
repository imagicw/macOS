#!/bin/bash

install_clash() {
  echo '>>> downloading latest clash file... <<<'
  echo '----------------------------------------'

  sudo wget https://release.dreamacro.workers.dev/latest/$1

  if [-e $1]; then
    echo '----------------------------------------'
    echo '>>> unzip file <<<'

    gunzip $1

    echo '>>> moving file <<<'

    sudo mv clash-linux-*-latest /usr/local/bin/clash

    sudo chmod +x /usr/local/bin/clash

    echo '>>> finished <<<'
  else
    echo '>>> cannot find file <<<'
  fi

  exit
}

PS3="请选择你的设备型号："
models=("Pi 3 model B" "Pi 4 model B" "退出")
select model in "${models[@]}"; do
  case $model in
    "Pi 3 model B")
      install_clash "clash-linux-armv7-latest.gz"
      ;;

    "Pi 4 model B")
      install_clash "clash-linux-arm64-latest.gz"
      ;;

    "退出")
      echo "用户退出"
      exit
      ;;

    *)
    echo "输入无效 $REPLY";;
  esac
done
