# Changelog

## [8.4.21](https://github.com/snowdreamtech/php/compare/rocky-v8.4.21...rocky-v8.4.21) (2026-06-29)


### 🐛 Bug Fixes

* **docker:** ensure php binary exists and enhance smoke tests ([4c232ac](https://github.com/snowdreamtech/php/commit/4c232ac739111c9a0ec35191d89f488d0262cc86))
* use ghcr.io for base images to avoid rate limits ([9f1d73a](https://github.com/snowdreamtech/php/commit/9f1d73a75a61f2f368f5572c4bd28f4c92ef8fd5))


### 🛠 Refactoring

* **docker:** optimize php symlink creation logic ([31ee0f6](https://github.com/snowdreamtech/php/commit/31ee0f69df51f65a1bbe4852a4d81a0167981afc))


### ♻️ Miscellaneous Chores

* release main ([f66597a](https://github.com/snowdreamtech/php/commit/f66597a5feae95e8853f4cc730c81e93e172f6ca))
* release main ([b3a5cc9](https://github.com/snowdreamtech/php/commit/b3a5cc9ef0a64a7bc04ed7c2acf0cca5327c5c26))
* **release:** deduplicate CHANGELOG headers ([82be3d5](https://github.com/snowdreamtech/php/commit/82be3d5576b65b7f69b1a9afb8604f2c8f0e47f7))

## [8.4.21](https://github.com/snowdreamtech/php/compare/rocky-v8.4.21...rocky-v8.4.21) (2026-06-26)


### 🚀 Features

* **docker:** add igbinary php extension to all variants ([9352a12](https://github.com/snowdreamtech/php/commit/9352a12ac6eb9fc79b791ec5f3608c7267465652))
* **docker:** add memcached and mongodb extensions to all variants ([1882bf2](https://github.com/snowdreamtech/php/commit/1882bf2c2f0ce81297b110c41ec7b6ebcbcbc5ce))


### 🐛 Bug Fixes

* copy native default html pages to unified NGINX_WEB_ROOT in Dockerfile.nginx ([7ff647e](https://github.com/snowdreamtech/php/commit/7ff647e59dec8544a4993edb6bda3f95a9b1049e))
* **docker:** remove unavailable pecl extensions from rocky variants ([c1232c9](https://github.com/snowdreamtech/php/commit/c1232c96f777d7f23cef866633448a8e2b61b4b6))


### 🐛 Bug Fixes

* sync template files to use standardized /var/www/html Nginx web root ([900719b](https://github.com/snowdreamtech/php/commit/900719baea0811ea008ca7f04ed2c7ea03147827))


### ♻️ Miscellaneous Chores

* **docker:** add comments for temporarily removed rocky pecl extensions ([ddb1dc7](https://github.com/snowdreamtech/php/commit/ddb1dc7f98dd4c1d9e67dedda6419f3c7129d627))
