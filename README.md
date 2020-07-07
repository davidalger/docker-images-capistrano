# Capistrano Docker Images

![Docker Image CI](https://github.com/davidalger/docker-images-capistrano/workflows/Docker%20Image%20CI/badge.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/davidalger/capistrano.svg?label=Docker%20Pulls)

## Supported Tags

* `3.14`

## Example Usage

```
CAPISTRANO_VERSION=3.14

## when on macOS environments use the special ssh auth socket
if [[ $OSTYPE =~ ^darwin ]]; then
  SSH_AUTH_SOCK=/run/host-services/ssh-auth.sock
fi

docker run --rm -it -v $(pwd):/opt/capistrano -w /opt/capistrano \
  --env SSH_AUTH_SOCK=/tmp/ssh-auth.sock -v "${SSH_AUTH_SOCK:-/dev/null}":/tmp/ssh-auth.sock \
  docker.io/davidalger/capistrano:${CAPISTRANO_VERSION} \
  bundle exec cap stage deploy --dry-run
```

## License

This work is licensed under the MIT license. See [LICENSE](https://github.com/davidalger/warden/blob/develop/LICENSE) file for details.

## Author Information

This project was started in 2020 by [David Alger](https://davidalger.com/).
