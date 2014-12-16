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

def heredity(gene, size, limit, right_data)
  p gene.father
  if gene.father.evaluate == 100
    p gene.generation
    return
  end
  if gene.generation > 100
    return
  end
  gene.pop
  gene.pop_size.times do |i|
    gene.append(Genetic.new(gene.father.data ,gene.mother.data, size, limit, right_data))
  end
  gene.evaluate()
  heredity(gene, size, limit, right_data)
end

time = 0
right_data = make_random_data(size, limit)
p right_data
gene = GeneticList.new()
10.times do
  gene.append(Genetic.new(make_random_data(size,limit), make_random_data(size,limit), size, limit, right_data))
end
gene.evaluate()
heredity(gene, size, limit, right_data)
