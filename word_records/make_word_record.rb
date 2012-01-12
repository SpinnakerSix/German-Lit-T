#!/bin/ruby

# run this to create the file based word record databases

def make_file(word)
  if not FileTest.exists?("#{word}.txt")
    f = File.new("#{word}.txt", 'w')
    f.close
  end
end


if FileTest.exists?("../wordlist.txt")
  f = File.open("../wordlist.txt", "r")
  f.each do |wordpair|
    if wordpair[0] != "#"
      wordpair = wordpair.strip.split(", ")
      make_file(wordpair[0])
    end
  end
  f.close 
else 
  puts "a wordlist.txt does not exist"
end

