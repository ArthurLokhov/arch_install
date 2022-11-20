# Git

Для того, чтобы начать работать с Git, нам потребуется дать ему знать кто мы такие. Вместо _**\<email>**_ укажите email своего GitHub аккаунта, вместо _**\<name>**_ укажие имя своего GitHub пользователя.

```shell
git config --global user.email "<email>"
git config --global user.name "<name>"
```

Теперь настроим SSH для более удобной работы с GitHub. Сначала сгенерируем SSH ключи.

```shell
paru -S openssh
ssh-keygen
cat ~/.ssh/id_rsa.pub
```

Далее переходим в настройки GitHub аккаунта и там находим пункт "**SSH and GPG keys**". Затем нажимаем на "**New SSH key**" и вводим свой публичный ssh ключ, который мы сгенерировали.
