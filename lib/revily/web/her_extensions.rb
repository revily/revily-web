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
  end
end