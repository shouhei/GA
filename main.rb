# -*- coding: utf-8 -*-
require_relative 'genetic'
require_relative 'genetic_list'
class Main
  attr_accessor :result
  def initialize(size, limit)
    @size = size
    @limit = limit
    @right_data = make_random_data()

    seed_data = []
    @size.times do
      seed_data << make_new_gen(make_random_data(),make_random_data())
    end

    @generation = GeneticList.new(seed_data)

    heredity()
    return
  end

  private
  def make_new_gen(father, mother)
    Genetic.new(father, mother, @size, @limit, @right_data)
  end

  def make_random_data()
    data = []
    @size.times do |i|
      data << rand(1..@limit)
    end
    data
  end

  def heredity()
    p @generation.datas[0]
    if @generation.datas[0].evaluate == 100
      @result = @generation.generation
      return
    end
    if @generation.generation > 100
      return
    end
    @generation.pop_size.times do |i|
      @generation.replace(make_new_gen(@generation.datas[0].data, @generation.datas[1].data))
    end
    @generation.alternate()
    heredity()
  end

end

data = Main.new(10,4)
p data.result
