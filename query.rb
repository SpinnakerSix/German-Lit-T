#!/usr/bin/env ruby


# this file creates a new bot and mine the search api for mispelled words
# and picks responses based on that
# 

require '/home/bitnami/tbot'


# list_of_words will be in this format
#list_of_words = [
#["abreviate", "abbreviate"],
#["equiptment", "equipment"],
#["beleive", "believe"],
#]


def parse_wordlist(n)
  l = []
  f = File.open(n, 'r')
  f.each do |wordpair|
    if wordpair[0] != '#'
      wordpair = wordpair.strip.split(', ')
      l << wordpair
    end
  end  
  f.close
  #puts l
  return l
end


def run_bot(client, list_of_words)

  url = "http://api.twitter.com/1/statuses/public_timeline.json"
  urls = make_urls(list_of_words)
  urls.each do |tmp|
    url = tmp[0] + "&since_id=#{retrieve_id(tmp[1])}"
    uri = URI(url)
    j = Net::HTTP.get(uri)
    r = JSON.parse(j)
    word = tmp[1]
    get_english(r, client, word)  
  end
end

def make_urls(list_of_words)
  r = []
  list_of_words.each do |pair|
    r << ["http://search.twitter.com/search.json?q=#{pair[0]}&result_type=recent", pair[1]]
  end
  return r
end

def save_id(num, word)
  f = File.open("word_records/#{word}.txt",'w')
  f.write(num.to_i + 1)
  f.close
end

def retrieve_id(word)
  f= File.open("word_records/#{word}.txt", 'r')
  s =  f.read
  f.close
  return s
end

def get_english(json_file, client, word)

  list = []
  json_file = json_file['results']
  json_file.each do |status|
    if status['text'][0..1] == "RT"
      next
    else 
      puts status['text']
      begin    
        post_correction(status['from_user'] ,word, client)
      rescue => e 
        if e.to_s.include?("403")
          puts e
          #Process.exit
        else
          puts e
        end
      end
    end
  end
  if not json_file[0].nil?
    save_id(json_file[0]['id'], word)
  end
  return list
end

def post_correction(user, word, client)

   client.status :post, "@#{user} I think you meant #{word}. #SpellPolice"
#  puts "@#{user} I think you meant #{word}."
#  client.status :post, "Food!"
end

f = File.open("word_records/_lastran", 'w')
f.write(" ")
f.close

list_of_words = parse_wordlist("wordlist.txt")
client = My_client.new.bot
run_bot(client, list_of_words)
