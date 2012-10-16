require 'sass'

def process(source_path, scope_selector, output_path)
  source_css_file = File.new(source_path)
  
  sass = "#{scope_selector} {\n"
  source_css_file.readlines.each do |line|
    sass << "  "
    sass << line
  end
  sass << "\n}"

  compiled_css = Sass.compile(sass)
  File.open(output_path, "w+") do |f|
    f.write compiled_css
  end
end

process("./source.css", "#gre-prep-course", "./compiled.css")