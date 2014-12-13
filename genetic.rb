class Genetic
  attr_accessor :data, :evaluation

  def initialize(father=[], mother=[],size, limit)
    @size = size
    @limit = limit
    @data = mutation(make_data(father,mother))
    @evaluate = 0
  end

  def evaluation(right_data)
    make_evaluation(right_data)
  end

  private
  def self.length_evaluation(ary)
    if ary.length != @size then
      raise "length short"
    end
  end

  def make_data(father,mother)
    length_from_father = rand(0..@size)
    length_from_mother = @size - length_from_father
    tmp = father[0..length_from_father] + mother[length_from_father..length_from_mother]
  end

  def mutation(data)
    where = rand(0..@size)
    val = rand(1..@limit+1)
    if val < @limit
      data[where] = val
    end
    data
  end

  def make_evaluation(right_data)
    right_data.each_with_index do |i,result|
      if @data[i] == result
        @evaluate += 10
      end
    end
    @evaluate
  end

end

tmp=Genetic.new([1,2,3,4,1,2,3,4,1,2],[4,3,2,1,4,3,2,1,4,3,], 10, 4)
p tmp.data
p tmp.evaluation([3,2,4,1,3,2,4,1,3,2])
