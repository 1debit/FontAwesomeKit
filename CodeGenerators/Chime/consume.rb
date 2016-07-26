# Dependencies: 'sudo npm install -g glyphs2font'

#PRE: directory of .svg files
#POST: '_variables.scss', '~.h', '~.m' files 
File.delete("chime-font.svg") if File.exist?("chime-font.svg")
charMap = Hash.new

# Naming convention: "a.home.svg" => {"a": "home"}
Dir.entries(".").each do |filename|
	file = filename.split(".")
	extension = file[-1]
	if extension == "svg"
		contentName = file[0]
		iconName = file[1]
		charMap[contentName] = iconName
	end

end
def write_style(key_map)
	puts "Creating _variables.scss, found #{key_map.keys.length} items"
	header = "// Generated Code\n"
    key_map.each do |key, value|
    	#puts "$ch-var-#{value}: \"\\f#{key}\";\n"
      header_template = "$ch-var-#{value}: \"\\f#{key}\";\n"

      header << header_template
    end
    return header
end
def write_header(key_map)
	puts "Generating chime-font.yml"
	header = "font:\n"
	header <<    
	"    svg:        chime-font.svg
    ttf:        chime-font.ttf
    eot:        chime-font.eot
    woff:       chime-font.woff
    css:        chime-font.css
    html:       chime-font.html
    name:       Chime-WebFont
    prefix:     chime
    fixedwidth: false
    height:     1000
    descent:    150
    normalize:  true
    center:     true
    round:      10e12\n"
    header << "glyphs:\n"
    key_map.each do |key, value|
    	header << "    - glyph:    #{key}.#{value}.svg\n"
    	header << "      name:     #{value}\n"
    	header << "      code:     0x#{key.ord.to_s(16).rjust(4, '0')}\n"
    end
    return header
end

File.open("_variables.scss", 'w+') { |f| f.write(write_style(charMap)) }
load "gen.rb"
puts 'Running FontAwesomeKit, creating "FAKChime.fakgen.m" and "FAKChime.fakgen.h" in current directory'
File.open("chime-font.yml", 'w+') { |f| f.write(write_header(charMap)) }
`glyphs2font chime-font.yml`
puts "Generating css and ttf files"