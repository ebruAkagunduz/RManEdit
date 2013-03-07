#!/usr/bin/env ruby

begin 
  arr = Array.new
  Dir.foreach(Dir.pwd){|file|; arr.push(file);}
  if not File::directory?("~/.config/rmanedit")
    `mkdir ~/.config/rmanedit`
  end
  `cp lang.rb ~/.config/rmanedit`
  `sudo chmod +x bin/rmanedit`
  `sudo cp bin/rmanedit /usr/bin/rmanedit`
  `sudo cp -r images /usr/share/pixmaps`
  if not File::directory?( "/usr/local/share/locale/tr/LC_MESSAGES" ) 
  `sudo mkdir -p /usr/local/share/locale/tr/LC_MESSAGES`
  end
  `sudo rmsgfmt po/tr/rmanedit.po -o /usr/local/share/locale/tr/LC_MESSAGES/rmanedit.mo`
  `sudo mkdir /usr/share/doc/rmanedit/`
  `sudo cp LICENSE AUTHORS TRANSLATORS Changelog /usr/share/doc/rmanedit`
rescue
  puts "installation error"
end