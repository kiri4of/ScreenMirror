import SwiftUI
import ApphudSDK

@main
struct ScreenMirrorApp: SwiftUI.App {
    // app delegate
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var appState = AppState()
    @StateObject private var onboardingViewModel = OnboardingViewModel()
    @StateObject private var paywallViewModel = PayWallViewModel()
  //  @StateObject private var mainViewModel = MainViewModel()

    init() {
        Apphud.start(apiKey: Config.apphudAPIKey)
        PremiumViewModel.shared.load()
    }

    var body: some Scene {
        WindowGroup {
            contentView
                .preferredColorScheme(.light)
        }
    }
    
    //MARK: - View builder
    @ViewBuilder
    private var contentView: some View {
        switch appState.flow {
        case .launching:
            LaunchScreenView()
        case .onboarding:
            OnboardingView(viewModel: onboardingViewModel)
                .onAppear {
                    onboardingViewModel.onFinish = { appState.finishOnboarding() }
                }
        case .paywall:
            PayWallView(viewModel: paywallViewModel)
                .environmentObject(PremiumViewModel.shared)
                .onAppear {
                    paywallViewModel.onClosed = {
                        appState.closePaywall()
                    }
                }
        case .main:
            //MainView(viewModel: mainViewModel)
            ContentView()
        }
    }
}
