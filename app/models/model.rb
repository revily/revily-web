module Model
  extend ActiveSupport::Concern

  included do
    include Her::Model
    use_api Revily::Web.api
    request_new_object_on_build true
  end
end
