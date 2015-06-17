class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :cors_set_access_control_headers, only: [:create]
  
  def create
    application = Application.find_by(url: request.env['HTTP_ORIGIN'])
    if !application
      render json: "Unregistered application", status: :unprocessable_entity
    else
      @event = application.events.build
      @event.name = params[:event_name]
      if @event.save
        render json: @event, status: :created
      else
        render @event.errors, status: :unprocessable_entity
      end
    end
  end

  def preflight
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'

      render :text => '', :content_type => 'text/plain'
    end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end


  private
  
  def event_params
    params.permit(:event_name)
  end
end