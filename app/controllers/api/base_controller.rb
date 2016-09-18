class Api::BaseController < ApplicationController
  skip_before_action :authenticate
end
