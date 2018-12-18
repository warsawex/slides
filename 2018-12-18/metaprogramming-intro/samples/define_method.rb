class Foo
  def bar
    "Real implementation"
  end
end

Foo.new.bar # => "Real implementation"

Foo.define_method(:bar) { "Fake implementation" }

Foo.new.bar # => "Fake implementation"
