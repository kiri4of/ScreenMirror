import Foundation
import SwiftUI
import StoreKit

class OnboardingViewModel: ObservableObject {
    //array of data
    let pages: [OnboardingPage] = [
        OnboardingPage(
            upperHeader: NSLocalizedString("Welcome to", comment: "Onboarding blue title part"),
            lowerHeader: NSLocalizedString("Screen Mirror", comment: "Onboarding black title part"),
            firstLine: NSLocalizedString("Stream your phone's display to your ", comment: "Onboarding first line"),
            secondLine: NSLocalizedString("TV in a flash with just a tap", comment: "Onboarding second line"),
            imageName: "onb1"
        ),
        OnboardingPage(
            upperHeader: NSLocalizedString("Quick conect", comment: "Onboarding blue title part"),
            lowerHeader: NSLocalizedString("and cast", comment: "Onboarding black title part"),
            firstLine: NSLocalizedString("Your phone and TV must be on the ", comment: "Onboarding first line"),
            secondLine: NSLocalizedString("same WI-FI network", comment: "Onboarding second line"),
            imageName: "onb2"
        ),
        OnboardingPage(
            upperHeader: NSLocalizedString("We'd love to", comment: "Onboarding blue title part"),
            lowerHeader: NSLocalizedString("hear your review", comment: "Onboarding black title part"),
            firstLine: NSLocalizedString("Tell us what you think - we're here", comment: "Onboarding first line"),
            secondLine: NSLocalizedString("to make it better", comment: "Onboarding second line"),
            imageName: "onb3"
        ),
        OnboardingPage(
            upperHeader: NSLocalizedString("Mirror photos", comment: "Part 1 of 'What people say about us' heading"),
            lowerHeader: NSLocalizedString("and apps", comment: "Part 2 of 'What people say about us' heading"),
            firstLine: NSLocalizedString("Just one click to see any photos or ", comment: "Onboarding first line"),
            secondLine: NSLocalizedString("film from your phone on your TV.", comment: "Onboarding second line"),
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
