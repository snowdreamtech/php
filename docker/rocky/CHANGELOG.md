# Changelog

## [8.4.21](https://github.com/snowdreamtech/php/compare/rocky-v8.4.21...rocky-v8.4.21) (2026-06-25)


### 🚀 Features

* implement multi-flavor tag architecture (cli, cgi, fpm) mirroring aria2 ([80b783e](https://github.com/snowdreamtech/php/commit/80b783e1ab3e6b8c5af7e68586b568a34d985fba))


### 🐛 Bug Fixes

* **cgi:** expose port 9000 and bind to 0.0.0.0 ([2a9cc50](https://github.com/snowdreamtech/php/commit/2a9cc503f9b006f8b12ddaca366e3d9ce58eb5c1))
* **docker:** correct PHP package names for Rocky Linux ([b5d22c3](https://github.com/snowdreamtech/php/commit/b5d22c36b67635453a0b69db2e932b3e0c98e4bc))
* **docker:** dynamic resolution of php-cgi and php-fpm binaries in entrypoint scripts ([43007d5](https://github.com/snowdreamtech/php/commit/43007d51272ed08951fb2e26ab6da63549d197ae))
* **docker:** fix smoke test hanging for CGI and FPM failing to start ([397c558](https://github.com/snowdreamtech/php/commit/397c55850d99924606368cf4c6d48c3307d1a08f))
* **docker:** pin precise PHP 8.4 versions and fix package names for Alpine, Debian and Rocky ([0125f3e](https://github.com/snowdreamtech/php/commit/0125f3e48210bd6a3adb24909f2160ba83872b78))
* **docker:** update debian php version and drop strict pinning for rocky ([9180828](https://github.com/snowdreamtech/php/commit/91808284063ba748d2c7604313a9cded4d7e1769))
* **fpm-rocky:** create /run/php-fpm PID directory at startup ([2b28c9f](https://github.com/snowdreamtech/php/commit/2b28c9fba72e0c076191aae3916dff476d1187f6))
* **fpm:** broaden nginx filter to ignore systemd service drops ([ffb327c](https://github.com/snowdreamtech/php/commit/ffb327c3c6a7553c1426ef751d4c621896915767))
* **fpm:** ensure PID directories exist across all distros ([f24518f](https://github.com/snowdreamtech/php/commit/f24518f3d0baedc97b90d2de5a197c0c38c9edc4))
* **fpm:** ignore nginx-provided php-fpm.conf in config discovery ([69d556a](https://github.com/snowdreamtech/php/commit/69d556a3f982249fa6a853a99f5fc1040dce4301))
* **fpm:** replace find-based config discovery with deterministic path lookup ([02e7a56](https://github.com/snowdreamtech/php/commit/02e7a564769e24d33ac9bb2fe37efe673ff2102c))
* **rocky:** remove spurious nginx/httpd configs from php-fpm image ([e7b0a2b](https://github.com/snowdreamtech/php/commit/e7b0a2ba33bb1b4514cb9a3df2b00beea32ab26f))


### 🛠 Refactoring

* add fallback defaults to environment variables for robustness ([a59e915](https://github.com/snowdreamtech/php/commit/a59e9156505df045f8b94b79eb6183d7e9cb8913))
* enforce POSIX compliance by replacing \s with [[:space:]] ([0dc4efb](https://github.com/snowdreamtech/php/commit/0dc4efb365d9f3564e4e917b5eecdade4b287531))
* optimize configuration file lookup to prevent redundant searches ([61fdce7](https://github.com/snowdreamtech/php/commit/61fdce71a715629031ca4206c530eee6b47c75f6))


### 📖 Documentation

* remove redundant 10-base-init.sh references and physical files ([65b490f](https://github.com/snowdreamtech/php/commit/65b490f506c2ada537baafd08e5b5d8d6baafc3a))
