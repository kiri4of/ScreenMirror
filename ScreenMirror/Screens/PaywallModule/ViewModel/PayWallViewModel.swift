
import SwiftUI
import ApphudSDK
import Combine

enum PlanType {
    case yearly
    case weekly
}

class PayWallViewModel: ObservableObject {
    
    @Published var selectedPlan: PlanType = .weekly {
        didSet {
            // обновляем тумблер, если строку выбрали вручную
            let shouldBeOn = (selectedPlan == .weekly)
            if enableTrial != shouldBeOn { enableTrial = shouldBeOn }
        }
    }
    
    @Published var enableTrial: Bool = true {
        didSet {
            // переключаем план согласно тумблеру
            if enableTrial,  selectedPlan != .weekly { selectedPlan = .weekly  }
            if !enableTrial, selectedPlan != .yearly { selectedPlan = .yearly  }
        }
    }
    
    @Published var subscriptionDateToggle: Bool = true {
        didSet {
            // переключаем план согласно тумблеру
            if subscriptionDateToggle, selectedPlan != .weekly
            { selectedPlan = .weekly  }
            
            if !subscriptionDateToggle, selectedPlan != .yearly
            { selectedPlan = .yearly  }
        }
    }
    
    @Published var hasTrial: Bool = false
    
    var onClosed: (() -> Void)?
    
    let premiumManager = PremiumViewModel.shared
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        refreshHasTrial()
        
        premiumManager.$products
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.refreshHasTrial()
            }
            .store(in: &cancellables)
        
        premiumManager.$premium
            .removeDuplicates()
            .filter{ $0 }
            .receive(on: RunLoop.main)
            .sink { [weak self] _ in
                self?.onClosed?()
            }
            .store(in: &cancellables)
    }

    
    @MainActor func select(plan: PlanType) {
        selectedPlan = plan                        // didSet синхронизирует тумблер
    }
 
    
    @MainActor func continueTapped() {
        
        // 1. Нужный SKU берём по текущему плану
        let wantedDuration = enableTrial ? "week" : "year"
        
        // 2. Берём первый продукт соответствующей длительности
        guard let product = premiumManager.products
            .first(where: { $0.duration == wantedDuration }) else {
            print("❌ Suitable product not found")
            return
        }
        
        // 3. Покупка + закрытие paywall ТОЛЬКО при успехе
        Task { @MainActor in
            let ok = await premiumManager.purchase(product)
            //Если сразу переходит на гланый экран здесь можно поставть if ok {...}
            onClosed?()
        }
    }
    
    
    /// Re‑evaluate flag every time the plan changes or products arrive
    func refreshHasTrial() {
        let relevant = premiumManager.products.filter {
            $0.duration == (selectedPlan == .weekly ? "week" : "year")
        }
        hasTrial = relevant.contains(where: \.hasIntroTrial)
        // Если trial‑пары нет — выключаем тумблер
        if !hasTrial { enableTrial = false }
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


