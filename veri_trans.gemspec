Gem::Specification.new do |s|
  s.name = 'veri_trans'
  s.version = '0.1.1'
  s.summary = 'veritrans Air Direct API'
  s.description = 'A Ruby wrapper library for veritrans Air Direct API'
  s.authors = ['Yuichiro NAKAGAWA']
  s.email = 'ii.hsif.drows@gmail.com'
  s.homepage = 'https://github.com/Mekajiki/VeriTrans'
  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.add_dependency 'activemodel', '~> 4.0'
  s.add_dependency 'active_model_serializers', '0.8.1'
  s.add_dependency 'activesupport', '~> 4.0'
  s.add_dependency 'rest-client', '1.6.7'
  s.add_dependency 'uuidtools', '2.1.4'
  s.add_dependency 'minitest-reporters', '~> 0.5'
  s.add_dependency 'test-unit', '2.5.5'
  s.license = 'MIT'
end
