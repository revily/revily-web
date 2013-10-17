module Her::Model::Associations
  class Association
    def page(number=nil)
      return self if number.nil?
      self.where(:page => number)
    end

    def per(number=nil)
      return self if number.nil?
      self.where(:per => number)
    end

    def method_missing(method, *args, &blk)
      if association_path = @parent.attributes[:_links].present? && @parent.attributes[:_links][@name] && @parent.attributes[:_links][@name][:href]
        @klass.get(association_path, @params).send(method, *args, &blk)
      else
        fetch.send(method, *args, &blk)
      end
    end
  end

  class BelongsToAssociation
    def fetch
      foreign_key_value = @parent.attributes[@opts[:foreign_key].to_sym] || (@parent.attributes.include?(@name) && @parent.attributes[@name].present? && @parent.attributes[@name][@klass.primary_key])
      return @opts[:default].try(:dup) if (@parent.attributes.include?(@name) && @parent.attributes[@name].nil? && @params.empty?) || (@parent.persisted? && foreign_key_value.blank?)

      if @parent.attributes[@name].blank? || @params.any?
        path_params = @parent.attributes.merge(@params.merge(@klass.primary_key => foreign_key_value))
        path = build_association_path lambda { @klass.build_request_path(path_params) }
        @klass.get(path, @params)
      else
        @parent.attributes[@name]
      end
    end
  end
end