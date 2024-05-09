class UserController < ApplicationController

  def home
    render({:template => "user_page/all_users"})
  end

  def all_users
    render({:template => "user_page/all_users"})
  end

  def username
    name_of_user = params.fetch("username")
    @user = User.where({:username => name_of_user}).at(0)
    render({:template => "user_page/user_details"})
  end

  def add_new_user
    @new_username = params.fetch("input_username")

    new_user = User.new
    new_user.username = @new_username

    if new_user.valid?
      new_user.save
      redirect_to("/users/#{@new_username}", { :notice => "User created successfully." })
    else
      redirect_to("/users", { :notice => "User failed to create successfully." })
    end
  end

  def update_user

    @user_id = params.fetch("user_id")
    @username = params.fetch("input_username")
    updated_user = User.where(:id => @user_id)[0]

    updated_user.username = @username


    if updated_user.valid?
      updated_user.save
      redirect_to("/users/#{@username}", { :notice => "User updated successfully." })
    else
      redirect_to("/users", { :notice => "User failed to update successfully." })
    end

  end

end
