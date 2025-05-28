import SwiftUI

struct PayWallType1View: View {
    
    @StateObject var viewModel: PayWallViewModel
    @EnvironmentObject var premium: PremiumViewModel
    @State private var selectedPeriod: Period = .year
    
    var body: some View {
        ZStack {
            AppColor.backgroundGradient.ignoresSafeArea()
            
            GlowingCircle()
                .zIndex(1)
            
            VStack {
                //Короче эта хуйня нужна для цены, сделай аналогично по paywall2 забери от туда цены которые приходят и в зависимости от состояния плашки просто показывай цену)
                
                //true = yearly, false = weekly
                if selectedPeriod == .year {
                    if let yearlyProduct = premium.products.first(where: { $0.productId.contains("year")}) {
                        OnboardingDescriptionView(
                            upperHeader: NSLocalizedString("Unlock exclusive", comment: "Paywall title part 1"),
                            highlightWord: NSLocalizedString("PRO", comment: ""),
                            lowerHeader: NSLocalizedString("PRO", comment: "Paywall title part 2"),
                            firstLine: NSLocalizedString("Easily mirror your screen for", comment: "Paywall subtitle line 1"),
                            secondLine: NSLocalizedString("\(yearlyProduct.display)", comment: "Paywall subtitle line 2"),
                            swapColors: true
                        )
                        .padding(.top, 15)
                    }
                } else {
                    if let weeklyProduct = premium.products.first(where: { $0.productId.contains("week")}) {
                        OnboardingDescriptionView(
                            upperHeader: NSLocalizedString("Unlock exclusive", comment: "Paywall title part 1"),
                            highlightWord: NSLocalizedString("PRO", comment: ""),
                            lowerHeader: NSLocalizedString("PRO", comment: "Paywall title part 2"),
                            firstLine: NSLocalizedString("Easily mirror your screen for", comment: "Paywall subtitle line 1"),
                            secondLine: NSLocalizedString("\(weeklyProduct.display)", comment: "Paywall subtitle line 2"),
                            swapColors: true
                        )
                        .padding(.top, 15)
                    }
                }
                
             
                Image("paywall1")
                    .resizable()
                    .scaledToFit()
                    .overlay (
                        PeriodSegmentedPicker(selection: $selectedPeriod)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 16),
                        alignment: .bottom
                    )


              
                
                Button(action: {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    viewModel.onClosed?()
                }) {
                    Text(NSLocalizedString("Continue", comment: "Continue button on paywall"))
                        .font(AppFonts.vietnam18SemiBold)
                        .foregroundColor(.white)
                        .frame(width: 344, height: 68)
                        .background(AppColor.peachGradient)
                        .cornerRadius(16)
                        .shadow(color: AppColor.peachShadowColor, radius: 11.3, x: 0, y: 10)
                }
                
                HStack(spacing: 40) {
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        viewModel.openPrivacyPolicy()
                    }) {
                        Text(NSLocalizedString("Privacy", comment: "Privacy link"))
                            .font(AppFonts.vietnam16Regular)
                            .foregroundColor(AppColor.descriptionColor)
                    }
                    
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        PremiumViewModel.shared.restore()
                    }) {
                        Text(NSLocalizedString("Restore", comment: "Restore purchase link"))
                            .font(AppFonts.vietnam16Regular)
                            .foregroundColor(AppColor.descriptionColor)
                    }
                    
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        viewModel.openTermsOfUse()
                    }) {
                        Text(NSLocalizedString("Terms", comment: "Terms link"))
                            .font(AppFonts.vietnam16Regular)
                            .foregroundColor(AppColor.descriptionColor)
                    }
                    
                    Button(action: {
                        viewModel.onClosed?()
                    }) {
                        Text(NSLocalizedString("Not now", comment: "Skip paywall"))
                            .font(AppFonts.vietnam16Regular)
                            .foregroundColor(AppColor.descriptionColor)
                    }
                }
                
                .font(AppFonts.vietnam16SemiBold)
                .foregroundColor(.gray)
                .padding(.top, 20)
            }
        }
    }
}

