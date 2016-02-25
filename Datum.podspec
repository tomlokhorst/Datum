Pod::Spec.new do |s|
  s.name         = "Datum"
  s.version      = "0.1.0"
  s.license      = "MIT"

  s.summary      = "Swift library for dealing with different date types."

  s.description  = <<-DESC
                   DESC

  s.authors           = { "Tom Lokhorst" => "tom@lokhorst.eu" }
  s.social_media_url  = "https://twitter.com/tomlokhorst"
  s.homepage          = "https://github.com/tomlokhorst/Datum"

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'

  s.source          = { :git => "https://github.com/tomlokhorst/Datum.git", :tag => s.version }
  s.requires_arc    = true
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "src/Datum"
  end

end
