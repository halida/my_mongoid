module MyMongoid

  class DuplicateFieldError < Exception; end

  # This module defines behaviour for fields.
  module Fields
    extend ActiveSupport::Concern
    included do
      class_attribute :aliased_fields
      class_attribute :fields

      self.fields = {}

      field(:_id)

    end

    module ClassMethods
      def field(name)
        add_field(name)
      end

      def add_field(name)
        name = name.to_s
        raise DuplicateFieldError.new(name) if fields[name]

        f = Field.new(name)

        self.fields[name.to_s] = f

        define_method(name) do
          read_attribute(name)
        end

        define_method("#{name}=") do |v|
          write_attribute(name, v)
        end
      end
    end

  end

  class Field
    attr_accessor :name

    def initialize(name)
      @name = name.to_s
    end
  end
end
