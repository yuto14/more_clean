class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_search
    protected

    def after_sign_in_path_for(resource)
        articles_path
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :address])
    end

    def set_search
        @search = Article.ransack(params[:q])
        @search_articles = @search.result
    end

    
end
