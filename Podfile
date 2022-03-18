# Uncomment the next line to define a global platform for your project
platform :ios, '15.2'

use_frameworks!

workspace 'Parking'

target 'Presentation' do
  
  xcodeproj 'Presentation/Presentation.xcodeproj'

  # Pods for Presentation
  
  pod 'IQKeyboardManager'
  
  target 'PresentationUITests' do
    # Pods for testing
  end

end

target 'Infrastructure' do
  
  xcodeproj 'Infrastructure/Infrastructure.xcodeproj'

  # Pods for DataAccessLocal
  # pod 'RealmSwift'

end

target 'Domain' do
  
  xcodeproj 'Domain/Domain.xcodeproj'

  # Pods for Domain

  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
   
  end

end
