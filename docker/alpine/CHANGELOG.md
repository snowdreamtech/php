# Changelog

## [8.4.22](https://github.com/snowdreamtech/php/compare/alpine-v8.4.22...alpine-v8.4.22) (2026-06-25)


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

## [8.4.22](https://github.com/snowdreamtech/php/compare/alpine-v8.4.22...alpine-v8.4.22) (2026-06-25)


### 🚀 Features

* implement multi-flavor tag architecture (cli, cgi, fpm) mirroring aria2 ([80b783e](https://github.com/snowdreamtech/php/commit/80b783e1ab3e6b8c5af7e68586b568a34d985fba))


### 🐛 Bug Fixes

* **cgi:** expose port 9000 and bind to 0.0.0.0 ([2a9cc50](https://github.com/snowdreamtech/php/commit/2a9cc503f9b006f8b12ddaca366e3d9ce58eb5c1))
* **docker:** dynamic resolution of php-cgi and php-fpm binaries in entrypoint scripts ([43007d5](https://github.com/snowdreamtech/php/commit/43007d51272ed08951fb2e26ab6da63549d197ae))
* **docker:** fix smoke test hanging for CGI and FPM failing to start ([397c558](https://github.com/snowdreamtech/php/commit/397c55850d99924606368cf4c6d48c3307d1a08f))
* **docker:** pin precise PHP 8.4 versions and fix package names for Alpine, Debian and Rocky ([0125f3e](https://github.com/snowdreamtech/php/commit/0125f3e48210bd6a3adb24909f2160ba83872b78))
* **fpm:** broaden nginx filter to ignore systemd service drops ([ffb327c](https://github.com/snowdreamtech/php/commit/ffb327c3c6a7553c1426ef751d4c621896915767))
* **fpm:** ensure PID directories exist across all distros ([f24518f](https://github.com/snowdreamtech/php/commit/f24518f3d0baedc97b90d2de5a197c0c38c9edc4))
* **fpm:** ignore nginx-provided php-fpm.conf in config discovery ([69d556a](https://github.com/snowdreamtech/php/commit/69d556a3f982249fa6a853a99f5fc1040dce4301))
* **fpm:** replace find-based config discovery with deterministic path lookup ([02e7a56](https://github.com/snowdreamtech/php/commit/02e7a564769e24d33ac9bb2fe37efe673ff2102c))


### 🛠 Refactoring

* add fallback defaults to environment variables for robustness ([a59e915](https://github.com/snowdreamtech/php/commit/a59e9156505df045f8b94b79eb6183d7e9cb8913))
* enforce POSIX compliance by replacing \s with [[:space:]] ([0dc4efb](https://github.com/snowdreamtech/php/commit/0dc4efb365d9f3564e4e917b5eecdade4b287531))
* optimize configuration file lookup to prevent redundant searches ([61fdce7](https://github.com/snowdreamtech/php/commit/61fdce71a715629031ca4206c530eee6b47c75f6))


### 📖 Documentation

* remove redundant 10-base-init.sh references and physical files ([65b490f](https://github.com/snowdreamtech/php/commit/65b490f506c2ada537baafd08e5b5d8d6baafc3a))
