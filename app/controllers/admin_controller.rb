class AdminController < ApplicationController
  before_filter :authenticate

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |user, password|
      user == "druecker" && password == "alumnusim"
    end
  end
end
