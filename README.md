# proxy-nginx-practice

- ngx_http_realip_module の動作確認

# memo

## ログに記録される接続元IPがクライアントのIPアドレスになる場合
- `docker compose up -d` を実行する
- `docker compose exec client curl http://172.20.0.3:80/index.html` を実行する
- `docker compose logs -f -n 1 backend` を実行し、以下のような出力結果になることを確認する

```shell
backend-1  | 172.20.0.2 - - [23/Mar/2024:13:30:31 +0000] "GET /index.html HTTP/1.0" 200 135 "-" "curl/8.6.0" "172.20.0.2, 172.20.0.3"
```

## ログに記録される接続元IPがリバースプロキシのIPアドレスになる場合
- `docker compose down` を実行する
- `./compose.yaml` の31行目をコメントアウトする
- `docker compose up -d` を実行する
- `docker compose exec client curl http://172.20.0.3:80/index.html` を実行する
- `docker compose logs -f -n 1 backend` を実行し、以下のような出力結果になることを確認する

```shell
backend-1  | 172.20.0.4 - - [23/Mar/2024:13:31:56 +0000] "GET /index.html HTTP/1.0" 200 135 "-" "curl/8.6.0" "172.20.0.2, 172.20.0.3"
```

# ref
- http://nginx.org/en/docs/http/ngx_http_realip_module.html
- https://qiita.com/tjun/items/f6e68924cf6bb616e4ec
- https://christina04.hatenablog.com/entry/2016/10/25/190000