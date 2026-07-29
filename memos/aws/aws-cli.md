# aws-cli

## Command

### ACCOUNT IDを取得する

```sh
aws sts get-caller-identity --query "Account" --output text
```

### Regionを取得する

```sh
aws configure get region
```

## 参考

- <https://github.com/suimenkathemove/aws-sandbox/tree/main/aws-cli>
