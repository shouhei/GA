class Genetic
  attr_accessor :data, :evaluate

  def initialize(father=[], mother=[], size, limit, right_data)
    @data = mutation(make_data(father, mother,size),size,limit)
    @evaluate = make_evaluation(right_data)
  end

  private
  def make_data(father, mother, size)
    length_from_father = rand(1..(size - 1))
    if length_from_father == (size - 1)
      father.clone
    else
      father[0..length_from_father] + mother[(length_from_father + 1)..(size-1)]
    end
  end

  def mutation(data,size,limit)
    tmp = rand(0..(size - 1))
    data[tmp] +=1
    if data[tmp] == (limit+1)
      data[tmp] = 1
    end
    data
  end

  def make_evaluation(right_data)
    @evaluate = 0
    right_data.each_with_index do |result, i|
      if @data[i] == result
        @evaluate += 10
      end
    end
    @evaluate
  end

end
