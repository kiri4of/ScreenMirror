import SwiftUI
import Combine

final class AppState: ObservableObject {
    enum Flow {
        case launching // show LaunchScreen
        case onboarding // first Launch show Onboarding
        case paywall // Paywall with subscription offers
        case main // Main Screen
    }
    
    @Published var flow: Flow = .launching
    
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: - Init
    init() {
        AppSignals.appstorePublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.decideInitialFlow()
            }
            .store(in: &cancellables)
    }
    
    func finishOnboarding() {
        //hasSeenOnboarding = true
        flow = .paywall
    }
    
    func closePaywall() {
        flow = .main
    }
    
    private func decideInitialFlow() {
        flow = hasSeenOnboarding ? .main : .onboarding
    }
}


