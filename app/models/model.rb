module Model
  extend ActiveSupport::Concern

  included do
    include Her::Model
    use_api Revily::Web.api
    request_new_object_on_build true
    after_initialize :define_paths

    scope :page, ->(page) { where(page: page) }
    scope :per, ->(per) { where(per: per) }
  end

  def define_paths
    links = self.attributes[:_links]

    if links
      (class << self; self; end).class_eval do
        links.keys.each do |link|
          define_method "#{link}_path" do
            links[link]["href"]
          end
        end
      end
    end
  end

  def links
    self.attribute(:_links)
  end

  # module ClassMethods

  #   def page(number=nil)
  #     return self if number.nil?
  #     return self.where(page: number)
  #   end

  # end

end