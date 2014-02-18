require 'my_mongoid/attributes'
require 'my_mongoid/fields'

module MyMongoid

  module Document
    extend ActiveSupport::Concern
    include Attributes
    include Fields

    def initialize(attrs={})
      init_attributes(attrs)
    end

    module ClassMethods
    end

  end
end
