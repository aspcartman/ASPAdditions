
Pod::Spec.new do |s|


  s.name         = "ASPAdditions"
  s.version      = "0.0.1"
  s.summary      = "ASPCartman's dev libs"

  s.license      = "MIT"


  s.author             = { "ASPCartman" => "aspcartman@gmail.com" }

  s.platform     = :ios, "5.0"


  s.source       = { :git => "http://github.com/aspcartman/ASPAdditions.git", :tag => "0.0.1" }


  s.source_files  = "*.{h,m}", "**/*.{h,m}"



  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  s.dependency 'KeepLayout', :git => "https://github.com/iMartinKiss/KeepLayout.git"
  s.dependency 'BlocksKit', :git => 'https://github.com/zwaldowski/BlocksKit.git'

end
