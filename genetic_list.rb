class GeneticList
  @@size = 10
  @@pop_size = @@size / 5
  attr_accessor :datas, :father, :mother, :generation
  def initialize()
    @datas = []
    @generation = 0
  end

  def append(data)
    @datas.push(data) if @datas.length < @@size
  end

  def evaluate()
    @generation += 1
    @datas.sort!{|prev, nex|
      prev.evaluate <=> nex.evaluate
    }.reverse!
    @father = @datas[0]
    @mother = @datas[1]
    return
  end

  def pop()
    @@pop_size.times do
      @datas.pop
    end
  end

  def pop_size()
    return @@pop_size
  end

end
