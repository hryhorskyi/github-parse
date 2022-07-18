# frozen_string_literal: true

class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        if @user.full_name.nil?
          format.html { redirect_to user_url(@user), notice: 'User does not found on GitHub.' }
        else
          format.html { redirect_to user_url(@user), notice: 'User was successfully found.' }
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    parse_full_name
    parse_repos if parse_full_name
  end

  private

  def user_params
    params.require(:user).permit(:login)
  end

  def parse_full_name
    name_url = "https://api.github.com/users/#{@user.login}"
    @name_data = parse(name_url)
    @user.full_name = @name_data[:name]
  end

  def parse_repos
    repo_url = "https://api.github.com/users/#{@user.login}/repos"
    @repos_data = parse(repo_url)
    @repos_data.each { |item| @user.repos << item[:name] }
  end

  def parse(url)
    false unless @data_json = URI(url).open { |content| content.read.inspect }
    @data = eval(JSON.parse(@data_json.gsub('=>', ':').gsub(':null,', ':nil,')))
    @data
  end
end
