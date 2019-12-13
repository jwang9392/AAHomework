require "byebug"
# Big O-ctopus and Biggest Fish
fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# Sliggish Octopus

def sluggish_octopus(arr)
  (0...arr.length - 1).each do |i|
    return arr[i] if arr[i+1...arr.length].all? {|fish| arr[i].length > fish.length }
  end
  arr[-1]
end 

# p sluggish_octopus(fish_arr)

# Dominant Octopus

def dominant_octopus(arr)
  return arr if arr.size <= 1

  mid = arr.size / 2
  left = dominant_octopus(arr.take(mid))
  right = dominant_octopus(arr.drop(mid))

  fish_merger(left, right)
end

def fish_merger(left, right)
  sorted = []
  # debugger
  until left.empty? || right.empty?
    case left.first.size <=> right.first.size
    when -1
      sorted << left.shift
    else
      sorted << right.shift
    end
  end

  sorted + left + right
end

# p dominant_octopus(fish_arr)[-1]

def clever_octopus(arr)
  longest = arr[0]
  length = arr[0].size

  (1...arr.length).each do |i|
    if arr[i].size > length
      longest = arr[i]
      length = arr[i].size
    end
  end

  longest
end

# p clever_octopus(fish_arr)

# Dancing Octopus
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# Slow Dance

def slow_dance(step, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if tile == step
  end
end

# p slow_dance("up", tiles_array)
#> 0

# p slow_dance("right-down", tiles_array)
#> 3

# Constant Dance!

new_tiles_data_structure = {}
tiles_array.each_with_index do |tile, i|
  new_tiles_data_structure[tile] = i
end

def fast_dance(step, new_tiles_data_structure)
  new_tiles_data_structure[step]
end

# p fast_dance("up", new_tiles_data_structure)
# #> 0

# p fast_dance("right-down", new_tiles_data_structure)
# #> 3