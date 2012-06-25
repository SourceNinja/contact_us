contact_us
==========

Simple contact form app with login. Uses devise for admin administration.

# Installation

You should just have to grab the directory and start rails and the app should start in development mode without any problems.
If you want to use something other than SQLite, you will need to configure the database in config/database.yml.

Adding the contacts should work out of the box and redirect to a "Thank you" page. If you'd like to actually see what entries
have been added, you'll need to add an admin user through the rails console. The app itself does not provide functionality for
this, on purpose.

```
Loading development environment (Rails 3.2.3)
irb(main):001:0> admin = Admin.create!(:email => 'admin@fakedomain.com', :password => 'password', :password_confirmation => 'password')
   (0.1ms)  begin transaction
  Admin Exists (6.4ms)  SELECT 1 FROM "admins" WHERE "admins"."email" = 'admin@fakedomain.com' LIMIT 1
  SQL (97.0ms)  INSERT INTO "admins" ("created_at", "current_sign_in_at", "current_sign_in_ip", "email", "encrypted_password", "last_sign_in_at", "last_sign_in_ip", "remember_created_at", "reset_password_sent_at", "reset_password_token", "sign_in_count", "updated_at") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)  [["created_at", Mon, 25 Jun 2012 16:10:43 UTC +00:00], ["current_sign_in_at", nil], ["current_sign_in_ip", nil], ["email", "admin@fakedomain.com"], ["encrypted_password", "$2a$10$zlu9EPOCQnfXzmAIOqGF9OAVs2UUaD1MyP0ABtuLXYgPJqGbmA2Jm"], ["last_sign_in_at", nil], ["last_sign_in_ip", nil], ["remember_created_at", nil], ["reset_password_sent_at", nil], ["reset_password_token", nil], ["sign_in_count", 0], ["updated_at", Mon, 25 Jun 2012 16:10:43 UTC +00:00]]
   (2.0ms)  commit transaction
=> #<Admin id: 2, email: "admin@fakedomain.com", encrypted_password: "$2a$10$zlu9EPOCQnfXzmAIOqGF9OAVs2UUaD1MyP0ABtuLXYgP...", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, created_at: "2012-06-25 16:10:43", updated_at: "2012-06-25 16:10:43">
```

Please choose a better password, though.

Once you've created the admin user, you should be able to log in on the app by going to ```/admin``` and entering the credentials that you created in the console.
Editing a contact has been disabled on purpose, but it should be fairly easy for you to add that back in if you'd like.