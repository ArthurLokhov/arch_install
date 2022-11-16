# ⌨ Моя конфигурация для разработки смарт-контрактов

## Перечень необходимого программного обеспечения

* Node Version Manager + Node LTS
* Truffle
* Ganache
* Solidity compiler(solc)
* MetaMask

## Установка Node Version Manager и Node LTS

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
source ~/.zshrc
nvm -v
nvm install --lts
```

## Установка Truffle

```
npm install -g truffle
truffle --version
```

## Установка Ganache

```
curl -LO https://github.com/trufflesuite/ganache-ui/releases/download/vx.x.x/ganache-x.x.x-linux-x86_64.AppImage
mkdir -p ~/Apps/ganache
mv ganache-x.x.x-linux-x86_64.AppImage ~/Apps/ganache.AppImage
cd ~/Apps/ganache
chmod a+x ./ganache.AppImage
./ganache.AppImage
```

1. Можно создать \~/.local/share/applications/ganache.desktop.

## Установка Solidity Compiler

```
npm install -g solc
solcjs --version
```

## Удаление всех инструментов

```
rm -rf "$NVM_DIR"

# Удалите эти строчки в вашем файле конфигурации ~/.zshrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

rm -rf ~/Apps/ganache
```

## Установка плагинов для Visual Studio Code

```
```
