def Bar
  def method_missing(*args)
    "This method exists"
  end
end

bar = Bar.new

bar.to_s # => "This method exists"
bar.no_it_doesnt # => "This method exists"
