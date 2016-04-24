class Hoge
  property :fuga

  def initialize
  end
end

h = Hoge.new
h.fuga = "piyo"
puts h.fuga.split("")
