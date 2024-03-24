# proxy-nginx-practice

- ngx_http_realip_module の動作確認

# memo

## overview

- サーバの前に直列で複数個リバースプロキシを置いた場合に、サーバのアクセスログに記録される「リクエストの送信元アドレス($remote_addr)」がngx_http_realip_moduleの設定によってどう変わるかを確認する

# ref
- https://zenn.dev/8rine23/articles/3dc60624d4a53d