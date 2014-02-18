module MyMongoid
  module Attributes
    extend ActiveSupport::Concern

    def process_attributes(attrs)
      raise ArgumentError.new(attrs) unless attrs.kind_of?(Hash)
      @attributes = {}
      attrs.each do |k, v|
        self.send "#{k}=", v
      end
    end

    alias_method :attributes=, :process_attributes

    def attributes
      @attributes
    end

    def read_attribute(name)
      name = name.to_s
      @attributes[name]
    end

    def write_attribute(name, value)
      name = name.to_s
      @attributes[name] = value
    end

    def new_record?
      true
    end

  end
end

