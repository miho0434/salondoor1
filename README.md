## アプリケーション名
サロンドア

## アプリケーション概要
ネイルサロンの働く環境に関する口コミを投稿したり、閲覧ができます。  
求職者の入社前後のギャップを少なくし、早期の離職を減らすことが目的です。

## URL


## テスト用アカウント
・Basic認証パスワード：2222  
・Basic認証ID：admin  
・メールアドレス：aaa@aaa 
・パスワード：aaaaaa1

## 利用方法
### ・口コミ投稿
1.　トップページのヘッダーからworker登録を行う。  
2.　口コミを投稿するボタンから  各項目（雰囲気・環境・働きやすさ/得られた技術、成長できるポイント/入社前後のギャップ/福利厚生・給与など待遇面/退職した、もしくは退職しようと考えている理由）を入力し投稿する。   

### ・口コミ閲覧
サロンの一覧ページの口コミ閲覧ボタンをクリックして、各項目の詳細を確認ができる。

## アプリケーションを作成した背景
前職の同僚(ネイリスト)に困っていることをヒアリングしたところ、「人を採用してもすぐに辞めてしまう」という課題を抱えていることが判明しました。  
同様のサロンも多いと推測し、解決するために、入社前にサロンの実態が見えるようになるアプリケーションを開発することにしました。


## 洗い出した要件
https://docs.google.com/spreadsheets/d/1CTqCBGSPcrbZhO5dWUK--oXG_mf6xKqyGfKDmE9rGiY/edit#gid=982722306

## 実装した機能についての画像やGIFおよびその説明
現在作成中のため、作成完了後に加筆予定

## 実装予定の機能
未定

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/a4e8e29ec0204aae82ea1de6b8a645ec.png)](https://gyazo.com/a4e8e29ec0204aae82ea1de6b8a645ec)

### workersテーブル(ワーカー管理機能)
| Column             | Type       | Options                  |
| ----------------   | --------   | ------------             |
★メール
| email              | string     | null: false ,unique: true|
★パスワード
| encrypted_password | string     | null: false              |
★ニックネーム
| nickname           | string     | null: false              |


### Association
has_many :comments

===========================================================
### commentsテーブル(口コミ管理機能)

| Column                | Type       | Options                        |
| -------------------   | --------   | -----------------              |
★雰囲気・環境・働きやすさ
| atmosphere            | text       |                                |
★得られた技術、成長できるポイント
| growth_potential      | text       |                                |
★入社前後のギャップ
| gap                   | text       |                                |
★福利厚生・給与など待遇面
| treatment             | text       |                                |
★退職した、もしくは退職しようと考えている理由
| reason_for_retirement | text       |                           |
★外部キー
| worker                | references | null: false ,foreign_key: true |
| salon                 | references | null: false ,foreign_key: true |


#### Asociation
belongs to :worker
belongs to :salon


===========================================================
### salonsテーブル(サロン管理機能)

| Column              | Type       | Options                  |
| ----------------    | --------   | ------------             |
★店名
| store_name          | string     | null: false              |
★本社名
| corporate_name      | string     | null: false              |
★勤務地(郵便番号)
| postal_code         | string     | null: false              |
★都道府県		
| prefecture_id       | integer    | null: false              |
★市町村
| city                | string     | null: false              |
★番地
| street_number       | string     | null: false              |
★ビル名
| building_name       | string     |                          |
★最寄駅
| station             | string     | null: false              |
★創業年
| established         | date       | null: false              |
★店舗数
| offices             | integer    | null: false              |

#### Association
has_many :comments
has_many :job_information

===========================================================
## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/c7f598e473611bb1bccea46bbdede745.png)](https://gyazo.com/c7f598e473611bb1bccea46bbdede745)

## 開発環境
Ruby/Ruby on Rails/MySQL/Github/render/Visual Studio Code


## ローカルでの動作方法
以下のコマンドを順に実行  
%git clone https://github.com/miho0434/salondoor1
%cd salondoor1 
%bundle install  
%yarn install  

## 工夫したポイント
実装後に加筆します。
