module Register
  macro included
    Store.instance.add({{@type}}.new)
  end
end

abstract class Base
  macro inherited
    include Register
  end
  abstract def greet
end

class Store
  getter! :items
  def self.instance
    @@instance ||= Store.new
  end

  def initialize
    @items = {} of String => Base
  end

  def add(instance)
    key = instance.class.name.split("::").last.downcase
    @items[key] = instance
  end
end

class Hoge < Base
  def greet
    "Hello, I'm hoge."
  end
end

class Fuga < Base
  def greet
    "Hello, I'm fuga."
  end
end

puts Store.instance.items
puts Store.instance.items["hoge"].greet
puts Store.instance.items["fuga"].greet
