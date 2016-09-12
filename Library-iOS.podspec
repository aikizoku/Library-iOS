Pod::Spec.new do |s|

s.name                  = "Library-iOS"
s.version               = "0.1.0"
s.summary               = "Yuki Hirose iOS Library"
s.homepage              = "https://github.com/aikizoku/Library-iOS"
s.author                = { "Yuki Hirose" => "https://github.com/aikizoku/Library-iOS"}
s.license               = { :type => "MIT", :file => "LICENSE" }
s.ios.deployment_target = "8.0"
s.source                = { :git => "https://github.com/aikizoku/Library-iOS.git", :tag => "#{s.version}" }
s.source_files          = "Library/**/*.swift"

end
