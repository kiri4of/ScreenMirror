import Foundation
import UIKit

class SettingsViewModel: ObservableObject {
    @Published var currentIcon: String? = UIApplication.shared.alternateIconName
    
    @Published var showIconMenu: Bool = false
    @Published var showFAQSheet: Bool = false
    @Published var showPaywall = false
    
    func changeAppIcon(to iconName: String?) {
        guard UIApplication.shared.supportsAlternateIcons else {
            print("❌ Alternate icons not supported")
            return
        }
        
        UIApplication.shared.setAlternateIconName(iconName) { error in
            if let error = error {
                print("❌ Failed to change icon: \(error.localizedDescription)")
            } else {
                print("✅ Icon changed to \(iconName ?? "primary")")
                DispatchQueue.main.async {
                    self.currentIcon = iconName
                }
            }
        }
    }
    
    func openTermsOfUse() {
        let url = Config.termsOfUseURL
        UIApplication.shared.open(url)
    }
    
    func openPrivacyPolicy() {
        let url = Config.privacyPolicyURL
        UIApplication.shared.open(url)
    }
    
}

