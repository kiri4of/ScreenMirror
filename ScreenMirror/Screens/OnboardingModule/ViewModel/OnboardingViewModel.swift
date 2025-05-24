import Foundation
import SwiftUI
import StoreKit

class OnboardingViewModel: ObservableObject {
    //array of data
    let pages: [OnboardingPage] = [
        OnboardingPage(
            upperHeader: NSLocalizedString("Welcome to", comment: ""),
            highlightWord: NSLocalizedString("Welcome", comment: ""),
            lowerHeader: NSLocalizedString("Screen Mirror", comment: "Onboarding black title part"),
            firstLine: NSLocalizedString("Stream your phone's display to your ", comment: ""),
            secondLine: NSLocalizedString("TV in a flash with just a tap", comment: ""),
            imageName: "onb1"
        ),
        OnboardingPage(
            upperHeader: NSLocalizedString("Quick conect", comment: ""),
            highlightWord: NSLocalizedString("Quick", comment: ""),
            lowerHeader: NSLocalizedString("and cast", comment: ""),
            firstLine: NSLocalizedString("Your phone and TV must be on the ", comment: ""),
            secondLine: NSLocalizedString("same WI-FI network", comment: ""),
            imageName: "onb2"
        ),
        OnboardingPage(
            upperHeader: NSLocalizedString("We'd love to", comment: ""),
            highlightWord: NSLocalizedString("review", comment: ""),
            lowerHeader: NSLocalizedString("hear your review", comment: ""),
            firstLine: NSLocalizedString("Tell us what you think - we're here", comment: ""),
            secondLine: NSLocalizedString("to make it better", comment: ""),
            imageName: "onb3"
        ),
        OnboardingPage(
            upperHeader: NSLocalizedString("Mirror photos", comment: ""),
            highlightWord: NSLocalizedString("Mirror", comment: ""),
            lowerHeader: NSLocalizedString("and apps", comment: ""),
            firstLine: NSLocalizedString("Just one click to see any photos or ", comment: ""),
            secondLine: NSLocalizedString("film from your phone on your TV.", comment: ""),
            imageName: "onb4"
        )
    ]
    
    @Published var currentPage: Int = 0
    
    private(set) var didShowRating = false
    
    //close onboarding
    var onFinish: (() -> Void)?
    
    func nextButtonTapped() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        } else {
            if !didShowRating {
                SKStoreReviewController.requestReview()
                didShowRating = true
            } else {
                //last page
                onFinish?()
            }
        }
    }
    
    
    func openTermsOfUse() {
        //let url = Config.termsOfUseURL
        //UIApplication.shared.open(url)
    }
    
    func openPrivacyPolicy() {
       // let url = Config.privacyPolicyURL
       // UIApplication.shared.open(url)
    }
}
