class ApplicationsController < ApplicationController
  def show
    @user = current_user
    @applications = @user.applications
    @application = Application.new
    @events = @application.events.group_by(&:name)
  end

  def new
    @application = Application.new
  end

  def create
    @user = current_user
    @application = current_user.applications.build(app_params)
    @new_application = Application.new
    if @application.save
      flash.now[:notice] = "Application registered."
    else
      flash[:error] = "There was an error registering the application. Try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @application = current_user.applications.find(params[:id])
    if @application.destroy
      flash.now[:notice] = "Application removed."
    else
      flash[:error] = "There was an error removing the application."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def app_params
    params.require(:application).permit(:name, :url)
  end
end
