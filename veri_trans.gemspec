Gem::Specification.new do |s|
  s.name = 'veri_trans'
  s.version = '0.1.2'
  s.summary = 'veritrans Air Direct API'
  s.description = 'A Ruby wrapper library for veritrans Air Direct API'
  s.authors = ['Yuichiro NAKAGAWA']
  s.email = 'ii.hsif.drows@gmail.com'
  s.homepage = 'https://github.com/Mekajiki/VeriTrans'
  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.add_dependency 'activemodel'
  s.add_dependency 'active_model_serializers'
  s.add_dependency 'activesupport'
  s.add_dependency 'rest-client', '1.6.7'
  s.add_dependency 'uuidtools', '2.1.4'
  s.add_dependency 'minitest-reporters'
  s.add_dependency 'test-unit'
  s.license = 'MIT'
end
