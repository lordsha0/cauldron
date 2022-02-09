#!/usr/bin/ruby

require 'rss'
require 'open-uri'

urls = File.open("/home/sha0/sanctum/cauldron/url.txt").map() {|line| line.split(" ").join(" ")}

display = File.open("/home/sha0/sanctum/cauldron/display.txt", 'w')

display.write("\n")
display.write(" ####################################################\n")
display.write(" # Welcome to the Cauldron, your daily mix of news! #\n")
display.write(" ####################################################\n")
urls.each do |url|
    URI.open(url) do |rss|
        feed = RSS::Parser.parse(rss)
        display.write("\n")
        display.write("\n")
        display.write("// #{feed.channel.title}\n")
        feed.items.each do |item|
            display.write("\n")
            display.write("> #{item.title}\n")
            display.write("% #{item.date}\n")
            display.write("$ #{item.link}\n")
      end
    end
end

system("more /home/sha0/sanctum/cauldron/display.txt")
