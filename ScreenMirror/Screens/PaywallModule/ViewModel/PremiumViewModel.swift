import Foundation
import ApphudSDK
import Combine

class PremiumViewModel: ObservableObject {
    
    static var shared = PremiumViewModel()
    
    @Published var premium = false
    @Published var products: [ApphudProduct] = []
    @Published var paywallType: Int = 1 // doesnt matter about paywall num here
    
    private init() {
        Task { @MainActor in
            hasPremiumAccess()
        }
    }
    
    // Загрузка доступных к покупке подписок из App Store
    @MainActor func load() {
//        #if DEBUG
//        AppSignals.appstore()
//        return
//        #endif
        
        Task { @MainActor in
            let paywall = await Apphud.placements(maxAttempts: 3).filter { $0.identifier == "main"}.first?.paywall
            paywallType = (paywall?.json?["paywall"] as? Int) ?? 1
            
            let mainPaywall = await Apphud.placements().first?.paywall
            products = mainPaywall?.products ?? []
            
            AppSignals.appstore()
        }
    }
    
    // Проверка есть ли подписка
    @MainActor private func hasPremiumAccess() {
        self.premium = Apphud.hasPremiumAccess()
    }
    
    // Покупка подписки
    @MainActor
      func purchase(_ product: ApphudProduct) async -> Bool {
          await withCheckedContinuation { continuation in
              Apphud.purchase(product) { result in
                  self.hasPremiumAccess()                       // обновляем флаг
                  let success = result.subscription != nil      // или другой критерий
                  continuation.resume(returning: success)
              }
          }
      }
//    @MainActor func purchase(_ product: ApphudProduct) {
//        Apphud.purchase(product) { result in
//            self.hasPremiumAccess()
//        }
//
//    }
    
    // Восстановление доступа к подписке
    @MainActor func restore() {
    #if DEBUG
        self.premium = true
        return
    #endif
        Apphud.restorePurchases { subscriptions, purchases, error in
            self.hasPremiumAccess()
        }
    }
    
}


extension ApphudProduct {
    
    // Расширение которое позволяет в красивой строке получить данные о цене и периоде подписки
    var display: String {
        "\(price ?? "")/\(duration ?? "")"
    }
    
    // Расширение которое позволяет определить период подписки
    var duration: String? {
        let durationTypes = ["week", "month", "year", "quarter"]
        
        for type in durationTypes {
            if productId.lowercased().contains(type.lowercased()) {
                return type
            }
        }
        
        return "week"
    }
    
    /// Returns `true` if the SKU has an introductory offer (free trial).
      var hasIntroTrial: Bool {
          guard let sk = skProduct else { return false }
          return sk.introductoryPrice != nil
      }
    
    /// Returns e.g. "$0.38/week" for yearly SKU, otherwise `nil`.
       var weeklyEquivalentDisplay: String? {
           guard duration == "year",
                 let priceNumber = skProduct?.price else { return nil }

           // 1. Цена делится на 52 недели
           let weekly = priceNumber.dividing(by: 52)

           // 2. Локализуем валюту
           let fmt = NumberFormatter()
           fmt.numberStyle = .currency
           fmt.locale = skProduct?.priceLocale

           guard let weeklyStr = fmt.string(from: weekly) else { return nil }
           return "\(weeklyStr)/week"
       }
    
    fileprivate var price: String? {
    #if DEBUG
        return "$3.99"
    #endif
        
        guard let value = skProduct?.price.stringValue else {
            return nil
        }
        
        return "\(symbol)\(value)"
    }
    
    fileprivate var symbol: String {
        return skProduct?.priceLocale.currencySymbol ?? "$"
    }
}

enum AppSignals {
    
    // Подписаться на паблишер можно из ContentView через .onReceive
    // Показывать онбординг или основной флоу приложения только тогда, когда пришли продукты
    static let appstorePublisher = PassthroughSubject<Void, Never>()
    
    static func appstore() {
        appstorePublisher.send()
    }
}
