require "nokogiri"
require "json"

file = File.read("./mdn-help/Tokens.xml")
doc = Nokogiri::XML(file)

tokens = doc.css("Token")

tokens.each do |token|
  keyword = token.css("Name").first.content
  documentation = token.css("Path").first.content.gsub("developer.mozilla.org/en-US/docs", "").gsub(/(c25d)?\.html$/, "")
  puts "#{keyword} #{documentation}"
end

# grep 'slice' mdn-reference.txt

# grep and cut on space
# grep -n 'floor' mdn-reference.txt | cut -d ' ' -f2

# split and get an array (index 1)
# grep -n 'floor' mdn-reference.txt | awk '{split($0,a," "); print a[2]}'
