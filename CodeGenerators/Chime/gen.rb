require '../CodeGenerator.rb'

names = [];
codes = [];
iconNames = [];

File.read("_variables.scss").each_line do |line| 
  parts = line.split(' ')
  # puts "parts: " + parts.join("-")
  name = parts[0]
  if name && name.start_with?('$ch-var-')
    name = name['ch-var-'.length..(name.length) -2]
    iconNames.push "ch-#{name}"
    if name === '500px'
      name = 'fivehundredpx'
    end

    nameParts = name.split('-')
    nameParts = nameParts.each_with_index.map do |p, i|
      if i < 1
        p
      else
        p = p.capitalize
      end
    end

    name = nameParts.join
    names.push name
  
    code = parts[1]
    # puts "code #{code}"
    code = code[2..-3]
    # puts "code-after: #{code}"
    codes.push "\\u#{code}"
  end
end

generator = CodeGenerator.new('Chime', names, codes, iconNames)
generator.generate


