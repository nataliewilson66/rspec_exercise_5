def zip(*arrs)
  len = arrs.first.length
  (0...len).map do |i|
    arrs.map  { |arr| arr[i] }
  end
end

def prizz_proc(arr, prc1, prc2)
  new_arr = []
  arr.each do |elem|
    new_arr << elem if (prc1.call(elem) && !prc2.call(elem)) || (!prc1.call(elem) && prc2.call(elem))
  end
  new_arr
end

def zany_zip(*arrs)
  len = 0
  arrs.each do |arr|
    len = arr.length if arr.length > len
  end
  arrs.each do |arr|
    arr.fill(nil, arr.length...len)
  end
  zip(*arrs)
end

def maximum(arr, &prc)
  return nil if arr.empty?
  winner = arr[0]
  largest = prc.call(arr[0])
  arr.each do |elem|
    if prc.call(elem) >= largest
      largest = prc.call(elem)
      winner = elem
    end
  end
  winner
end

def my_group_by(arr, &prc)
  group_hash = Hash.new(Array.new)
  arr.each do |elem|
    key = prc.call(elem)
    group_hash[key] += [elem]
  end
  group_hash
end

def max_tie_breaker(arr, prc, &block)
  return nil if arr.empty?
  winner = arr[0]
  largest = block.call(arr[0])
  arr.each do |elem|
    if block.call(elem) > largest
      largest = block.call(elem)
      winner = elem
    elsif block.call(elem) == largest
      if prc.call(elem) > prc.call(winner)
        largest = block.call(elem)
        winner = elem
      end
    end
  end
  winner
end

def silly_word(word, indices)
  idx_1 = indices[0]
  idx_2 = indices[-1]
  word[idx_1..idx_2]
end

def vowel_indices(word)
  inds = []
  vowels = "aeiou"
  word.each_char.with_index { |char, idx| inds << idx if vowels.include?(char) }
  inds
end

def silly_syllables(sentence)
  words = sentence.split(" ")
  words.each_with_index do |word, n|
    indices = vowel_indices(word)
    if indices.length >= 2
      words[n] = silly_word(word, indices)
    end
  end
  words.join(" ")
end