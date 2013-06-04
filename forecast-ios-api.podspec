Pod::Spec.new do |s|
  s.name         = "forecast ios api"
  s.version      = "0.0.1"
  s.summary      = "A simple Objective-C wrapper for the Forecast.io API."
  s.homepage     = "https://github.com/okitsutakatomo/forecast-ios-api"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = 'Takatomo Okitsu'
  s.source       = { :git => "https://github.com/okitsutakatomo/forecast-ios-api.git", :tag => "v0.0.1" }
  s.platform     = :ios, '5.0'
  s.source_files = 'Forecast'
  s.framework  = 'CoreLocation'
  s.requires_arc = true
  s.dependency 'AFNetworking'
end
