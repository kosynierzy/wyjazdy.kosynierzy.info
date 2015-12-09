class ApplicationController < ActionController::Base
  include RailsSso::Helpers

  protect_from_forgery

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActionView::MissingTemplate do |e|
      logger.error(e)
      request.format = :html
      render_404(e)
    end
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from ActionController::UnknownController, with: :render_404
    rescue_from AbstractController::ActionNotFound, with: :render_404
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  protected

  def render_404(exception)
    @not_found_path = exception.message
    respond_to do |format|
      format.html { render template: 'errors/error_404.html', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
end
