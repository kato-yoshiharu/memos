# Docker

Dockerには以下の4つのリソースがある。

- Image
- Container
- Volume
- Network

## exec

```sh
docker exec -it CONTAINER sh

# docker composeを使っている場合は以下のコマンドで代用できる
docker compose run <service name> sh
```

## Stop all containers

```sh
docker stop $(docker ps -qa)
```

## Delete all images

```sh
docker image prune -a -f
```

## Delete all volumes

```sh
docker volume rm $(docker volume ls -q)
```

## Delete all unused resources

```sh
docker system prune -a
```

## image push

```sh
docker image push NAME[:TAG]
```

## Troubleshooting

### com.docker.backend cannot start

```sh
rm -rf ~/.docker
# TODO: これも必要か検証する
rm -rf ~/Library/Containers/com.docker.docker
```
