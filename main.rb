# -*- coding: utf-8 -*-
require_relative 'genetic'
require_relative 'genetic_list'
size = 10
limit = 4

def make_random_data(size,limit)
  data = []
  size.times do |i|
    data.push(rand(1..limit))
  end
  data
end


def make_generation(gene,father, mother, size, limit, right_data, time)
  if father.evaluate == 100
    p time
    return
  end
  2.times do
    gene.sorted.pop
  end

  if time > 100
    p '達成できませんでした'
    return
  end

  generation = GeneticList.new()
  (size - 2).times do |i|
    generation.append(gene.sorted[i])
  end

  2.times do |i|
    genom = Genetic.new(father.data ,mother.data, size, limit)
    genom.evaluation(right_data)
    generation.append(genom)
  end
  generation.evaluate()
  time += 1
  make_generation(generation, generation.father, generation.mother, size, limit, right_data, time)
end

time = 0
right_data = make_random_data(size, limit)
p right_data
gene = GeneticList.new()
10.times do
  tmp = Genetic.new(make_random_data(size,limit), make_random_data(size,limit), size, limit)
  tmp.evaluation(right_data)
  gene.append(tmp)
end
gene.evaluate()
make_generation(gene, gene.father,gene.mother,size,limit,right_data,time)
