require '../lib/my_mongoid'

class FooModel
  include MyMongoid::Document
  field :number
  def number=(n)
    self.attributes["number"] = n + 1
  end
end

foo = FooModel.new({})
foo.process_attributes :number => 10
foo.attributes

foo.number = 10
foo.process_attributes :number => 10
foo
