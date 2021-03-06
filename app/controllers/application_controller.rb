class ApplicationController < ActionController::Base
#	before_filter :authorize
	before_filter :set_i18n_locale_from_params
	protect_from_forgery

  protected

  	def authorize
    	if User.count.zero?
      	redirect_to new_user_path, notice: "Please create the first user account" 
        return
      end
  		
      if user = User.find_by_id(session[:user_id])
        unless user.admin
          user.name = session[:name]
          redirect_to store_url, notice: "Welcome User! "

        end
      else
        redirect_to login_url, notice: "Please log in" 
      end
  	end

  	def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = 
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end
 
    def default_url_options
      { locale: I18n.locale }
    end
end
