class ShortyController < ApplicationController
  def index
    @error = error_params[:error]
  end

  def show
    @url = Url.find_by(id: show_params)
    @shorty_host_url = request.host
    @shorty_host_url += ":#{request.port}" if Rails.env.development?
  end

  def create
    url = Url.new(real_path: create_params,
                      shorty_path: generate_shorty_path)
    url.save!
    redirect_to action: "show", id: url.id
  rescue ActiveRecord::RecordInvalid => e
    redirect_to action: "index", error: "Invalid url format, please try again."
  rescue ActionController::ParameterMissing => e
    redirect_to action: "index", error: "Form blank. Please enter a url."
  end

  def short
    url = Url.find_by(shorty_path: short_params)
    redirect_to url.real_path
  end

  private

  def generate_shorty_path
    rand(36**8).to_s(36)
  end

  def create_params
    params.require(:shorty).require(:url)
  end

  def show_params
    params.require(:id)
  end

  def short_params
    params.require(:shorty_path)
  end

  def error_params
    params.permit(:error)
  end
end
