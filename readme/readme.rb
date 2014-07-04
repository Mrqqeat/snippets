#!/usr/local/bin/ruby

ARGV.each do |file|
  File.open(File.join(File.dirname(file), '..', 'README.md'), 'w') do |readme|
    File.read(file) =~ /\A#-{2}(.+)#\+{2}/m
    readme << $1.gsub!(/^# /, '')
    puts "Generated README.md file (#{File.expand_path(readme)})"
  end
end if $0 == __FILE__