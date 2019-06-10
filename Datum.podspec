Pod::Spec.new do |s|
  s.name         = "Datum"
  s.version      = "0.2.0"
  s.license      = "MIT"

  s.summary      = "Swift library for dealing with different date types."

  s.description  = <<-DESC
                    Swift library for dealing with different date types.
                   DESC

  s.authors           = { "Tom Lokhorst" => "tom@lokhorst.eu" }
  s.social_media_url  = "https://twitter.com/tomlokhorst"
  s.homepage          = "https://github.com/tomlokhorst/Datum"

  s.pod_target_xcconfig = { 'APPLICATION_EXTENSION_API_ONLY' => 'YES' }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.swift_version = '5.1'

  s.source          = { :git => "https://github.com/tomlokhorst/Datum.git", :tag => s.version }
  s.requires_arc    = true
  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = "src/Datum"
  end

end
