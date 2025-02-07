#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint rongta_printer.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'rongta_printer'
  s.version          = '1.0.0'
  s.summary          = 'A new Flutter project.'
  s.description      = <<-DESC
A new Flutter project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.public_header_files = 'Classes/Libs/include/RTPrinterSDK//{.h}'
  s.platform = :ios, '11.0'

  s.static_framework = true
  s.requires_arc = false
  s.preserve_paths = 'libRTPrinterSDK.a'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.xcconfig = {
    # here on LDFLAG, I had to set -l and then the library name (without lib prefix although the file name has it).
    'OTHER_LDFLAGS' => '-framework -lc++ -lRTPrinterSDK -lz',
    'USER_HEADER_SEARCH_PATHS' => '"${PROJECT_DIR}/.."/',
    "LIBRARY_SEARCH_PATHS" => '"${PROJECT_DIR}/.."/*',
  }

  # Here the name of the library can include lib as the file name has it too.
  s.vendored_libraries = 'libRTPrinterSDK.a'
end
