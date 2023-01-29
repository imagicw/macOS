echo '>>> downloading latest clash file... <<<'
echo '----------------------------------------'

sudo wget https://release.dreamacro.workers.dev/latest/clash-linux-armv7-latest.gz

echo '----------------------------------------'
echo '>>> unzip file <<<'

gunzip clash-linux-armv7-latest.gz

echo '>>> moving file <<<'

sudo mv clash-linux-armv7-latest /usr/local/bin/clash

sudo chmod +x /usr/local/bin/clash

echo '>>> finished <<<'