# -*- coding: utf-8 -*-
class GeneticList
  @@size = 10
  attr_accessor :datas, :father, :mother, :generation
  def initialize(args)
    @datas = args.sort{|prev, nex|
      nex.evaluate <=> prev.evaluate
    }
    @generation = 1
  end

  def replace(data)
    @datas.pop
    append(data)
  end

  def pop_size()
    @@size / 5
  end

  def alternate()
    @generation += 1
  end

  private
  def append(data)
    where = nil
    reverse =  @datas.reverse
    reverse.each_with_index do |tmp, i|
      if tmp.evaluate >= data.evaluate
        where =  @datas.length - i
        break
      end
      if i == 8
        where = 0
      end
    end
    @datas.insert(where, data)
  end

end
