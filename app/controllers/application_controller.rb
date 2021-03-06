class ApplicationController < ActionController::API
    include ActionController::MimeResponds
    include ExceptionHandler
    include AuthorizeRequest
    WillPaginate.per_page = 100
    before_action :authorize_request, except: [:allowed_domains]
    
    def allowed_domains
        # raise ExceptionHandler::AuthenticationError
        render json: {domains: AllowedDomain.all.pluck(:domain)}
    end

    def verify_admin
        if !current_user.is_admin?
            raise ExceptionHandler::InvalidToken
        end
    end

    def is_admin
       render json: {is_admin: (current_user.present? && current_user.is_admin?)}
    end
end
