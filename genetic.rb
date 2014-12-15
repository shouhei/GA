class Genetic
  attr_accessor :data, :evaluate

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

  def make_data(father, mother)
    length_from_father = rand(1..@size-1)
    if length_from_father >= 1
      tmp = father[0..length_from_father] + mother[(length_from_father+1)..@size-1]
    else
      mother
    end

  end

  def mutation(data)
    where = rand(0..@size-1)
    val = rand(1..@limit)
    data[where] = val
    data
  end

  def make_evaluation(right_data)
    right_data.each_with_index do |result,i|
      if @data[i] == result
        @evaluate += 10
      end
    end
    @evaluate
  end

end
