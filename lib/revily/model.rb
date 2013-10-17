module Revily
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

    def links
      self.attribute(:_links)
    end

    def method_missing(method, *args, &blk)
      path = self.class.build_request_path(:id => self.id)
      parsed_data = self.class.get_raw(path)[:parsed_data]
      attributes = self.class.parse(parsed_data[:data]).merge(:_metadata => parsed_data[:metadata], :_errors => parsed_data[:errors])
      if attributes.include?(method.to_sym) && attributes[method].present?
        self.assign_attributes(attributes)

        # Resend the method!
        send(method, *args, &blk)
      else
        super
      end
    end

    protected

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

    # module ClassMethods

    #   def page(number=nil)
    #     return self if number.nil?
    #     return self.where(page: number)
    #   end

    # end

  end
end