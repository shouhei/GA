class GeneticList
  @@size = 10
  attr_accessor :datas, :father, :mother, :sorted
  def initialize()
    @datas = []
  end

  def append(data)
    @datas.push(data) if @datas.length < @@size
  end

  def evaluate()
    @sorted = @datas.sort{|prev, nex|
      prev.evaluate <=> nex.evaluate
    }.reverse
    @father = @sorted[0]
    @mother = @sorted[1]
    return
  end

end
