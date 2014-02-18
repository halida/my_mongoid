require 'my_mongoid/attributes'

module MyMongoid

  module Document
    extend ActiveSupport::Concern
    include Attributes

    def initialize(attrs={})
      init_attributes(attrs)
    end

    module ClassMethods
    end

  end
end
