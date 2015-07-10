
Pod::Spec.new do |s|


  s.name         = "ASPAdditions"
  s.version      = "0.0.2"
  s.summary      = "ASPCartman's dev libs"

  s.license      = "MIT"


  s.author             = { "ASPCartman" => "aspcartman@gmail.com" }

  s.platform     = :ios, "5.0"


  s.source       = { :git => "https://github.com/aspcartman/ASPAdditions.git" }


  s.source_files  = "*.{h,m}", "**/*.{h,m}"



  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.libraries = "iconv", "xml2"

  s.requires_arc = true


end
