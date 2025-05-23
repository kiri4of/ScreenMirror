
import SwiftUI

@main
struct ScreenMirrorApp: App {
    
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    
    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: onboardingViewModel)
        }
    }
}
