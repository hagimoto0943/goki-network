# Goki.net

## サービス概要

ゴキブリが嫌いで、ゴキブリを見たくない人やスムーズに駆除したい人たちが、互いにゴキブリ対策を共有し合い、支え合う、ゴキブリ対策対策アプリです。

## メインのターゲットユーザー

- ゴキブリ対策をしたいが、何から始めれば良いかわからない方。
- ゴキブリが出たらパニックになってくスムーズに駆除ができない方。

## ユーザーが抱える課題

- ゴキブリ対策をインターネットで調べるが、情報が錯綜していてどのような対策が適切なのかわからない。
- 一人でゴキブリと対峙するのは怖い。

## 主な機能

- 一般ユーザー
  - ユーザー登録機能
  - ログイン、ゲストログイン機能
  - トップページ(サービス紹介ページ)閲覧
  - プライバシーポリシー、お問い合わせ、利用規約の閲覧
- ゲスト、ログインユーザー
  - ログイン、ログアウト機能 -リアルタイム退治中機能
    - 退治を開始できる
    - 退治を終了できる
    - 他ユーザーの退治中に「応援」（いいね）できる
    - 他ユーザーが退治を開始すると、リアルタイムで通知を受信できる
  - ゴキブリ対策投稿機能
    - タイトルを登録、閲覧、編集、削除できる
    - 本文を登録、閲覧、編集、削除できる
    - 写真、画像を登録、閲覧、編集、削除できる
    - 「駆除」か「予防登録」をステータスとして登録、閲覧、編集、削除できる
    - いいねができる
    - キーワード検索できる
    - 築年数、家の階数、家の構造（木造、簡易鉄骨、鉄筋コンクリート）で絞り込み検索できる
    - 対策の種類（予防、駆除）で絞り込み検索できる
  - プロフィール機能
    - 家屋の条件を登録、編集、削除できる
      - 築年数の登録、編集、削除ができる
      - 階数の登録、編集、削除ができる
      - 木造 or 鉄筋コンクリートを登録、編集、削除できる
    - ユーザーのアバターを登録、編集、削除できる
    - ユーザーの名前を編集できる
  - おすすめ対策グッズ閲覧機能
    - RakutenAPI を使用したお勧めゴキブリ対策グッズを閲覧できる

## 使用技術

- Ruby 3.0.2
- Rails 7.0.4.3
- PostgreSQL
- turbo-rails
- Tailwind CSS
- daisyUI
- RakutenAPI
- Render.com

## 画面遷移図

Figma: https://www.figma.com/file/JpAWH1FYorwIhAAy87n7l4/Goki.net?node-id=0%3A1&t=zhS7NEvNysyKEKCO-1

## ER 図

```mermaid
erDiagram
users ||--o{ fights : create
users ||--o{ posts : create
users ||--o{ likes : many_to_many
users ||--o{ supports : many_to_many
fights ||--o{ supports : many_to_many
posts ||--o{ likes : many_to_many
users ||--o| profiles : has_one

  users {
    int id PK
    string name
    string email
    string crypted_password
    string salt
    datetime created_at
    datetime updated_at
  }
  fights {
    int id PK
    int user_id FK
    int status
    datetime created_at
    datetime updated_at
  }
  profiles {
    int id PK
    int user_id FK
    int tool_id FK
    string avatar
    int house_age
    int house_floor
    int house_structure
  }
  posts {
    int id PK
    int user_id FK
    string title
    string body
    string thumbnail
    datetime created_at
    datetime updated_at
  }

  likes {
    int id PK
    int user_id FK
    int post_id FK
  }

  supports {
    int id PK
    int user_id FK
    int fight_id FK
  }


```

## なぜこのサービスを作りたいのか？

ひとり暮らしのゴキブリ対策は孤独で辛いものです。一人でゴキブリを退治するのはとても怖いと思います。しかし私は、誰かと一緒にいたり、同じくゴキブリと戦っている人がいると、少し恐怖が和らぎ、いつもより強気になれます。このような経験から、このサービスを考えました。

## スケジュール

企画〜技術調査：5/1 〆切</br>
README〜ER 図作成：5/1 〆切</br>
メイン機能実装：6/1 - 5/10</br>
MVP リリース：6/1 〆切</br>
本番リリース：6/30 〆切</br>
