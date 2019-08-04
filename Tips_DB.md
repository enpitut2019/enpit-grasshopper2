# DBテーブル設計

- 下のテーブルは，考えるためのメモです！
- 実際の schema は db/schema.rb を確認してください．

## users

- id: 
- name: string
- email: string
- password_digest: string

## profile

- id: 
- user_id: 
- goal: string
- daily_task: string
- monthly_score: integer
- experience: integer
- avatar_url: string

## tag

- id:
- user_id:
- tag: string

## record

- id:
- user_id:
- created_at:
- updated_at:

## memos

- id:
- record_id:
- memo: string
- like_conunt: integer
- created_at:
- updated_at:

# テーブル作成

## モデル作成 コマンド

- `rails generate model User name:string email:string password_digest:string`
- `rails generate model Profile goal:string daily_task:string monthly_score:integer experience:integer avatar_url:string`
- `rails generate model record `
- `rails generate model Memo memo:string like_count:integer`

## マイグレーション

- マイグレーション = テーブルごとの db/migrate/**_create_**.rb に従ってDBにテーブルを作成 
  - `rails db:migrate`
- すでにテーブル定義している場合
  - `rails db:migrate:reset`

## サンプルデータ（seed）の作成

- デバッグ・デモのためのシードデータをテーブル挿入する
  - db/seeds.rb を編集
  - `rails db:seed`

## DB からテーブルの確認

- `rails dbconsole`
  - DBにログインしての確認
  - `select * from users;`

## Ruby からテーブルの確認

- `rails console --sandbox`
  - sandbox オプションつけるとロールバック（DBを変更前の状態に戻す）してくれる
  - `User.create(name: "hoge", email: "hoge@hoge.jp")`
  - `User.all`
  - `User.find_by(id: 1)`

