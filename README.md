# PHP

![Docker Image Version](https://img.shields.io/docker/v/snowdreamtech/php)
![Docker Image Size](https://img.shields.io/docker/image-size/snowdreamtech/php/latest)
![Docker Pulls](https://img.shields.io/docker/pulls/snowdreamtech/php)
![Docker Stars](https://img.shields.io/docker/stars/snowdreamtech/php)

Docker Image packaging for PHP. (amd64, arm32v5,  arm32v6, arm32v7, arm64v8, i386, mips64le, ppc64le,riscv64, s390x)

# Usage

To help you get started creating a container from this image you can either use docker-compose or the docker cli.

## Docker Cli

### Simple

```bash
docker run -d \
  --name=php \
  -e TZ=Asia/Shanghai \
  --restart unless-stopped \
  snowdreamtech/php:latest
```

### Advance

```bash
docker run -d \
  --name=php \
  -e TZ=Asia/Shanghai \
  -v /path/to/data:/path/to/data \
  --restart unless-stopped \
  snowdreamtech/php:latest
```

## Docker Compose

### Simple

```bash
services:
  php:
    image: snowdreamtech/php:latest
    container_name: php
    environment:
      - TZ=Asia/Shanghai
    restart: unless-stopped
```

### Advance

```bash
services:
  php:
    image: snowdreamtech/php:latest
    container_name: php
    environment:
      - TZ=Asia/Shanghai
    volumes:
      - /path/to/data:/path/to/data
    restart: unless-stopped
```

# Development

```bash
docker buildx create --use --name build --node build --driver-opt network=host
docker buildx build -t snowdreamtech/php --platform=linux/386,linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64,linux/ppc64le,linux/riscv64,linux/s390x . --push
```

## Reference

1. [使用 buildx 构建多平台 Docker 镜像](https://icloudnative.io/posts/multiarch-docker-with-buildx/)
1. [如何使用 docker buildx 构建跨平台 Go 镜像](https://waynerv.com/posts/building-multi-architecture-images-with-docker-buildx/#buildx-%E7%9A%84%E8%B7%A8%E5%B9%B3%E5%8F%B0%E6%9E%84%E5%BB%BA%E7%AD%96%E7%95%A5)
1. [Building Multi-Arch Images for Arm and x86 with Docker Desktop](https://www.docker.com/blog/multi-arch-images/)
1. [How to Rapidly Build Multi-Architecture Images with Buildx](https://www.docker.com/blog/how-to-rapidly-build-multi-architecture-images-with-buildx/)
1. [Faster Multi-Platform Builds: Dockerfile Cross-Compilation Guide](https://www.docker.com/blog/faster-multi-platform-builds-dockerfile-cross-compilation-guide/)
1. [docker/buildx](https://github.com/docker/buildx)

## Contact (备注：php)

* Email: sn0wdr1am@qq.com
* QQ: 3217680847
* QQ群: 949022145
* WeChat/微信群: sn0wdr1am

## License

MIT

This Docker image is distributed under the MIT License.  
It includes **Microsoft ODBC Driver 18 for SQL Server**, which is **not open source**.  

The Microsoft ODBC Driver is provided under Microsoft’s proprietary End User License Agreement (EULA).  
By using this image, you agree to the terms of the Microsoft Software License for the ODBC Driver.  

- The open-source parts of this image (scripts, Dockerfile, configuration) are licensed under MIT.  
- The Microsoft ODBC Driver binaries are licensed separately by Microsoft.  
- You may freely use this image in commercial environments, but the driver itself remains subject to Microsoft’s EULA.  

For details, see Microsoft’s official documentation:  
[ODBC Driver for SQL Server on Linux and macOS](https://learn.microsoft.com/en-us/sql/connect/odbc/linux-mac/system-requirements?view=sql-server-ver17)