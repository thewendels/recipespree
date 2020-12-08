class Api::UsersController < ApplicationController

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    if current_user
      @user = current_user
      render 'show.json.jb'
    end
  end

  def update
    if current_user
      @user = current_user

      @user.username = params[:username] || @user.username
      @user.email = params[:email] || @user.email
      @user.password = params[:password] || @user.password
      @user.password_confirmation = params[:password_confirmation] || @user.password_confirmation

      if @user.save
        render 'show.json.jb'
      else 
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    if current_user
      @user = current_user

      @user.destroy
      render json: {message: "Your account has been deleted! You can sign up again at any time."}
    end
  end

end
