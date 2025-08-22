class ApplicationController < ActionController::API

  def about
    render json: { message: "bigram-histogram v0.0.1 - ©#{ Date.today.year } Josh Frank", }, status: 200
  end

end
