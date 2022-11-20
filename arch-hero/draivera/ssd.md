# SSD

## TRIM

Сначала надо проверить поддерживают ли ваши диски _**TRIM**_.

```shell
lsblk --discard
```

Если у столбцов _**DISC-GRAN**_ и _**DISC-MAX**_ не нулевые значения, то значит _**TRIM**_ поддерживается. Если у вас там нули, то данный пункт настроек вы пропускаете.

Включим поддержку _**TRIM**_.

<pre class="language-shell"><code class="lang-shell"><strong>sudo systemctl enable fstrim.timer</strong></code></pre>
