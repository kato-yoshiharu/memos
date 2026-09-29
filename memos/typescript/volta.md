# volta

## command not found

```shell
volta setup
```

## Install and use particular version

```sh
volta install <tool[@version]>
```

## Delete package

```sh
rm -rf ~/.volta/tools/image/[package]/[version]
```

## Pin

package.jsonにnodeやpnpmのバージョンを固定したい場合に使う。

```sh
volta pin <tool[@version]>
```

```sh
# 例えば
volta pin node@20.11.0
```
