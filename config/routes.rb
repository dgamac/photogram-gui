Rails.application.routes.draw do
  get("/", {:controller => "user", :action => "home"})
  get("/users", {:controller => "user", :action => "all_users"})
  get("/users/:username", {:controller => "user", :action => "username"})
  post("/add_user", {:controller => "user", :action => "add_new_user"})
  post("/update_user/:user_id", :controller => "user", :action => "update_user")
  


  get("/photos", {:controller => "photos", :action => "all_photos"})
  get("/photos/:photo_id", {:controller => "photos", :action => "photo_detail"})
  post("/insert_photo_record", {:controller => "photos", :action => "add_new_photo"})
  post("/update_photo/:photo_id",{ :controller => "photos", :action => "update"})
  get("/delete_photo/:photo_id", {:controller => "photos", :action => "destroy"})


  post("/add_comment", {:controller => "photos", :action => "add_comment"})

end
