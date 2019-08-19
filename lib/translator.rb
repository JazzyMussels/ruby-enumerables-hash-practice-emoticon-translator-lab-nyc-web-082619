require "yaml"

def load_library(path)
  emoticon_hash = {:get_meaning => {}, :get_emoticon => {}}
  emoticons = YAML.load_file(path)
  emoticons.each do |emotion, symbols_array|
    emoticon_hash[:get_meaning][symbols_array[1]] = emotion 
     emoticon_hash[:get_emoticon][symbols_array[0]] = symbols_array[1] 
  end 
   emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  
  emoticon_hash[:get_emoticon][emoticon] ? emoticon_hash[:get_emoticon][emoticon] : "Sorry, that emoticon was not found"
  
  #emoticon_hash.each do |get_types, info|
    #info.each do |english, japanese|
     #return japanese if english == emoticon 
    #end 
  #end
  #p  "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emotion)
  emoticon_hash = load_library(path)
  emoticon_hash.each do |get_types, info|
    info.each do |emoji, word|
     return word if emoji == emotion
    end 
  end
  p "Sorry, that emoticon was not found"
end