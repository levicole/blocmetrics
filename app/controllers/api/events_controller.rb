class API::EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
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


  private
  
  def event_params
    params.permit(:event_name)
  end
end