module MyMongoid
  module Attributes
    extend ActiveSupport::Concern

    def init_attributes(attrs)
      raise ArgumentError.new(attrs) unless attrs.kind_of?(Hash)
      @attributes = {}
      attrs.each do |k, v|
        @attributes[k.to_sym]= v
      end
    end

    def attributes
      @attributes
    end

    def read_attribute(name)
      name = name.to_sym
      @attributes[name]
    end

    def write_attribute(name, value)
      name = name.to_sym
      @attributes[name] = value
    end

    def new_record?
      true
    end

  end
end

