# Changelog

## [8.4.21](https://github.com/snowdreamtech/php/compare/rocky-v8.4.21...rocky-v8.4.21) (2026-06-25)


### 🚀 Features

* **rocky:** install mainstream PHP extensions and Composer ([5b9623f](https://github.com/snowdreamtech/php/commit/5b9623fe78e0a509900f7374050b80a6577df9e5))


### ♻️ Miscellaneous Chores

* add line continuation character to nginx package installation in Dockerfiles ([3a63ed4](https://github.com/snowdreamtech/php/commit/3a63ed4d2854195dd5479e37a8988e13f84d8117))

## [8.4.21](https://github.com/snowdreamtech/php/compare/rocky-v8.4.21...rocky-v8.4.21) (2026-06-25)


### 🚀 Features

* introduce nginx flavor for an out-of-the-box PHP-FPM + Nginx bundled environment ([67c2f4f](https://github.com/snowdreamtech/php/commit/67c2f4f47f0e67b5c44a8982977765a2e198da29))


### 🐛 Bug Fixes

* keep 25-nginx-start.sh uniformly in entrypoint.d directory and explicitly copy it ([c366eda](https://github.com/snowdreamtech/php/commit/c366eda8e851c616e17f144f9feefdb92fcba65a))
* remove redundant entrypoint.d directory creation in cli variant ([1624963](https://github.com/snowdreamtech/php/commit/1624963edaffc83bc6d0f7c5e4538b382b2e9c11))
* symlink nginx logs to stdout/stderr for proper container logging ([bc12ab6](https://github.com/snowdreamtech/php/commit/bc12ab69ea43fdb910fcaf7cc0f65967f21d3116))
* whitelist nginx conf.d and http.d directories in gitignore ([1d51c0c](https://github.com/snowdreamtech/php/commit/1d51c0ccab324f2b2f8a7ff500909f221b735825))


### 🛠 Refactoring

* explicitly copy variant-specific entrypoint scripts instead of relying on post-copy deletion ([4fa1dcf](https://github.com/snowdreamtech/php/commit/4fa1dcf80802b91a5612560ced99b2f50ffcfad9))


### ♻️ Miscellaneous Chores

* style fixes and remove trailing empty lines ([d09187f](https://github.com/snowdreamtech/php/commit/d09187f4756c95d7155a091cb633f1839462cb86))
