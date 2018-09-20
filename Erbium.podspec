Pod::Spec.new do |s|

  s.name         = "Erbium"
  s.version      = "4.2.0"
  s.author       = { "Bas van Kuijck" => "bas@e-sites.nl" }
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.homepage     = "http://www.e-sites.nl"
  s.summary      = "Light weight tool for detecting the current device and screen size written in swift."
  s.source       = { :git => "https://github.com/e-sites/Erbium.git", :tag => "#{s.version}" }
  s.source_files = "Sources/**/*.*"
  s.platform     = :ios, '8.0'
  s.frameworks   = "LocalAuthentication"
  s.requires_arc = true
end
