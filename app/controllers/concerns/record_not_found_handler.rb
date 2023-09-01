module RecordNotFoundHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  end

  private

  def record_not_found
    render json: { error: 'Record not found' }, status: :not_found
  end
end