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
      def field(*args)
        add_field(*args)
      end

      def add_field(*args)
        name = args[0].to_s
        opts = args[-1].kind_of?(Hash) ? args[-1] : {}

        raise DuplicateFieldError.new(name) if fields[name]

        f = Field.new(name, opts)

        self.fields[name] = f

        define_method(name) do
          read_attribute(name)
        end
        alias_method opts[:as], name if opts[:as]

        define_method("#{name}=") do |v|
          write_attribute(name, v)
        end
        alias_method "#{opts[:as]}=", "#{name}=" if opts[:as]
      end
    end

  end

  class Field
    attr_accessor :name, :options

    def initialize(name, options={})
      @name = name
      @options = options
    end
  end
end
