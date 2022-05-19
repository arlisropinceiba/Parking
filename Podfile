# ----------------- Platform -----------------
platform :ios, '15.2'

use_frameworks!

workspace 'Parking'

# ----------------- Vars -----------------
def podRealmSwift
  pod 'RealmSwift'
end

def podSwinject
  pod 'Swinject'
end

# ----------------- Presentation -----------------
target 'Presentation' do
  xcodeproj 'Presentation/Presentation.xcodeproj'
  # Pods for Presentation
  pod 'IQKeyboardManager'
  podRealmSwift
  target 'PresentationUITests' do
    # Pods for testing
    podRealmSwift
  end
end

# ----------------- Infrastructure -----------------
target 'Infrastructure' do
  xcodeproj 'Infrastructure/Infrastructure.xcodeproj'
  # Pods for Infrastructure
  podRealmSwift
#  podSwinject
end

# ----------------- Domain -----------------
target 'Domain' do
  xcodeproj 'Domain/Domain.xcodeproj'
  # Pods for Domain
#  podSwinject
  target 'DomainTests' do
    inherit! :search_paths
    # Pods for testing
#    podSwinject
  end
end
