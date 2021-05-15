
Pod::Spec.new do |s|
  s.name             = 'Tom'
  s.version          = '1.0.0'
  s.summary          = 'A smooth, moving equalizer view'
  s.description      = <<-DESC
  Tom is a smooth, moving equilazer view written in Swift for iOS developers. 
  It is easy to make auido view now!
                       DESC

  s.homepage         = 'https://github.com/Retro-Cartoons/Tom'
  s.screenshots     = 'https://media.giphy.com/media/OoC14F1Xz8QzmnCAeO/giphy.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Retro Cartoons' => 'demirciy.software@gmail.com' }
  s.source           = { :git => 'https://github.com/Retro-Cartoons/Tom.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'

  s.source_files = 'Sources/Tom/Classes/**/*'
  # s.resources = 'Tom/Assets/*'
end
