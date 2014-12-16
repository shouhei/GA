# -*- coding: utf-8 -*-
require_relative 'genetic'
require_relative 'genetic_list'
class Main
  attr_accessor :result
  def initialize(size, limit)
    @size = size
    @limit = limit
    @generation = GeneticList.new()
    @right_data = make_random_data()
    @size.times do
      @generation.append(make_new_gen(make_random_data(),make_random_data()))
    end
    @generation.evaluate()
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
      data.push(rand(1..@limit))
    end
    data
  end

  def heredity()
    p @generation.father
    if @generation.father.evaluate == 100
      @result = @generation.generation
      return
    end
    @generation.pop
    @generation.pop_size.times do |i|
      @generation.append(make_new_gen(@generation.father.data, @generation.mother.data))
    end
    @generation.evaluate()
    heredity()
  end

end

data = Main.new(10,4)
p data.result
