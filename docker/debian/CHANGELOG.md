# Changelog

## [8.4.16](https://github.com/snowdreamtech/php/compare/debian-v8.4.16...debian-v8.4.16) (2026-06-26)


### 🚀 Features

* add acme.sh to nginx variants and update to v3.1.3 ([c1c0ae4](https://github.com/snowdreamtech/php/commit/c1c0ae4178be1003cbb5bd684f1685abe6ad0cb3))
* unify PHP-FPM and Nginx user to www-data ([1d4bea4](https://github.com/snowdreamtech/php/commit/1d4bea42a6b662eafa048ba360e212703a84312b))


### 🐛 Bug Fixes

* **docker/alpine:** replace non-existent php84-cli with php84 package and remove duplicate opcache in all variants ([1b75739](https://github.com/snowdreamtech/php/commit/1b75739edd1d55e352c28e40641b46352edf0a7e))
* **docker:** ensure php-cli is installed for composer across fpm, cgi, and nginx variants ([9fe24e4](https://github.com/snowdreamtech/php/commit/9fe24e444cfdce27974b90fb7af8ac10c46f653a))
* **docker:** resolve multi-arch build errors and improve composer installation robustness ([29551e3](https://github.com/snowdreamtech/php/commit/29551e3f62bab4a7983ee621367d14c7e4fc2b52))
* **docker:** resolve PECL package version pinning and missing sockets in Rocky ([45b5177](https://github.com/snowdreamtech/php/commit/45b51772cf2a409f386f6c67233f9ff881143ddc))
* **docker:** use www-data instead of nginx for PHP-FPM user in Debian nginx variant ([df946fb](https://github.com/snowdreamtech/php/commit/df946fb0959d7784a7b947b3d4c8199afa80d5b8))
* remove hardcoded email from acme.sh installation ([92f3878](https://github.com/snowdreamtech/php/commit/92f3878b8d63b6cecfcd5e5d53e2853b1814cc47))
* rename cron start script to match COPY globs in Dockerfile ([2769cd5](https://github.com/snowdreamtech/php/commit/2769cd518e638fe9435868d3099a23800d7d7508))
* start cron daemon in entrypoint and fix indentation in rocky Dockerfile ([f0701a2](https://github.com/snowdreamtech/php/commit/f0701a25241d1ad60abd04641dfc0faaa971b25b))


### 📖 Documentation

* **changelog:** update changelogs for new extensions ([bdc028f](https://github.com/snowdreamtech/php/commit/bdc028ff3b3bdf1ae78b53c34e1eee16355cbc64))

## [8.4.16](https://github.com/snowdreamtech/php/compare/debian-v8.4.16...debian-v8.4.16) (2026-06-25)


### 🚀 Features

* **debian:** install mainstream PHP extensions and Composer ([974e500](https://github.com/snowdreamtech/php/commit/974e50004218eff744a97a01d93a5951211ac526))


### ♻️ Miscellaneous Chores

* add line continuation character to nginx package installation in Dockerfiles ([3a63ed4](https://github.com/snowdreamtech/php/commit/3a63ed4d2854195dd5479e37a8988e13f84d8117))
