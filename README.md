# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# DBテーブル設計

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

## generation commands
rails generate model User name:string email:string password_digest:string
rails generate model Profile goal:string daily_task:string monthly_score:integer experience:integer avatar_url:string
rails generate model record 
rails generate model Memo memo:string like_count:integer
