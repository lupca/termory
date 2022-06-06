Gem::Specification.new do |s|
    s.name        = 'termory'
    s.version     = '0.0.0'
    s.summary     = "Termory, this is magic!"
    s.description = "A magic for life developer."
    s.authors     = ["Dang Thanh Tung"]
    s.email       = 'dangthanhtung.open@gmail.com'
    s.files       = ["lib/termory.rb"]
    s.executables = ['termory']
    s.homepage    = 'https://rubygems.org/gems/hola'
    s.license     = 'MIT'
    s.files = Dir.glob("{bin,lib}/**/*")
    s.require_path = "lib"
    s.bindir = "bin"
    s.add_dependency('activerecord')
    s.add_dependency('sqlite3')
  end