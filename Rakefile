
begin
  require 'VERSION'
  require 'jasmine'
  require 'uglifier'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

desc "uglify"
task :uglifier do
  compact = Uglifier.compile(File.read("src/nerin.js"))
  File.open("src/nerin-#{VERSION}.min.js" , "w"){|f| f.write compact}
end
