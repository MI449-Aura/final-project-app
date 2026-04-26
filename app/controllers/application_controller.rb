class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  rescue_from ActionController::InvalidAuthenticityToken, with: :handle_invalid_authenticity_token

  private

  def handle_invalid_authenticity_token
    origin = request.headers["Origin"]

    Rails.logger.warn(
      "Invalid CSRF token rejected: origin=#{origin.inspect} base_url=#{request.base_url.inspect} path=#{request.fullpath.inspect}"
    )
    redirect_to new_session_path, alert: "Your session or request origin changed. Please try signing in again."
  end
end
