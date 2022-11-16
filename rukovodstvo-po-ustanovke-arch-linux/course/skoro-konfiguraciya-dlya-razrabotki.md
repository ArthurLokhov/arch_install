# ⌨ (Скоро) Конфигурация для разработки

## Установка Golang

```
cd ~/Downloads
curl -L 'https://go.dev/dl/go1.X.X.linux-amd64.tar.gz' -O
sha256sum go1.X.X.linux-amd64.tar.gz
sudo tar -xzf go1.X.X.linux-amd64.tar.gz -C /usr/local # (1)
sudo vim ~/.zshrc ->
    export PATH=$PATH:/usr/local/go/bin
go version
go env
```

1. /usr/local является рекомендованной директорией для установки golang.

## Обновление Golang

```
rm -rf /usr/local/go && tar -xzf go1.X.X.linux-amd64.tar.gz -C /usr/local
```

## Безопасность Golang файлов

```
sudo chown -R root:root /usr/local/go # (1)
```

1. Если хотите, чтобы .go файлы можно было запускать лишь через root пользователя.
