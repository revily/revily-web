module Model
  extend ActiveSupport::Concern

  included do
    include Her::Model
    use_api Revily::Web.api
  end
end