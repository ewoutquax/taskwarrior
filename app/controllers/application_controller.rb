class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  USERS = { 'task' => 'warrior' }.freeze

  before_action :authenticate

  def authenticate
    return unless Rails.env.production?
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
  end
end
