class ActivationsController < ApplicationController
  skip_before_filter :authorize
  def index
    activation = Activation.find_by_link(params[:act_link])
  #  unless @current_user
      if activation and !activation.nil?
        activation.user.status = 1
        if activation.user.save
          redirect_to home_path, notice: "#{activation.user.email} was successfully activated"
          activation.destroy
        else
          redirect_to home_path, notice: "Activation error. Please, try again."
        end
      else
        redirect_to home_path, flash: { error: "Activation link doesn't exists." }
      end
    #else
    #  redirect_to home_path, notice: "You already logged in."
    #end
  end
  
  def resend
    respond_to do |format|
      if @current_user
        unless @current_user.is_activated?
          @current_user.activations.destroy_all
          @current_user.activations.create(link: random_string)
          UserNotifier.signup(@current_user.activations.first).deliver
          format.js
          unless request.env['HTTP_REFERER'].blank?
            format.html { redirect_to :back, notice: "Activation URL was resended." }
          else
            format.html { redirect_to :home, notice: "Activation URL was resended." }
          end
        else
          format.html { redirect_to home_path, flash: { info: "Your account is already activated." }}
        end
      else
          format.html { redirect_to home_path, flash: { info: "Please, log in." }}
        end
      end
  end
end
