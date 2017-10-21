### Rails ActiveRecord Joins, Group & Count

This repo is my answer for this [StackOverflow question](https://stackoverflow.com/q/46860489/1577357).

#### Getting Started

1. Clone this project
2. Run `bundle install`
3. Run `rake db:create && rake db:migrate && rake seed`

After you see `Users created` message in your Terminal, continue with section below:

```
$ rails console
Hirb.enable
=> true

User.joins(:status).select("users.country AS user_country", "statuses.status AS user_status", "COUNT(*) AS count").where("user_status = 'Active'").group("user_country")

  User Load (0.3ms)  SELECT users.country AS user_country, statuses.status AS user_status, COUNT(*) AS count FROM "users" INNER JOIN "statuses" ON "statuses"."user_id" = "users"."id" WHERE (user_status = 'Active') GROUP BY user_country

+----+--------------+-------------+-------+
| id | user_country | user_status | count |
+----+--------------+-------------+-------+
|    | Brazil       | Active      | 7     |
|    | China        | Active      | 9     |
|    | India        | Active      | 11    |
|    | USA          | Active      | 7     |
+----+--------------+-------------+-------+

Status.where(status:"Active").count
=> 34
```

#### TL;DR

This is what you need:

```
User.joins(:status).select("users.country AS user_country", "statuses.status AS user_status", "COUNT(*) AS count").where("user_status = 'Active'").group("user_country")
```
