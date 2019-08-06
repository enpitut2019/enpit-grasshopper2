module ProfileHelper
    def current_profile
        if session[:user_id]
          @current_profile ||= Profile.find_by(id: session[:user_id])
        end
    end
end
