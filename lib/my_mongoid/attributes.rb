module MyMongoid
  module Attributes
    extend ActiveSupport::Concern

    def init_attributes(attrs)
      raise ArgumentError.new(attrs) unless attrs.kind_of?(Hash)
      @attributes = attrs
    end

    def attributes
      @attributes
    end

    def read_attribute(name)
      @attributes[name]
    end

    def write_attribute(name, value)
      @attributes[name] = value
    end

    def new_record?
      true
    end

  end
end

