import SwiftUI

struct PayWallType2View: View {
    @StateObject var viewModel: PayWallViewModel
    @EnvironmentObject var premium: PremiumViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            AppColor.backgroundGradient.ignoresSafeArea()
            
            GlowingCircle()
                .zIndex(1)
            
            VStack {
                // Header
                OnboardingDescriptionView(
                    upperHeader: NSLocalizedString("Access Premium", comment: "Paywall title part 1"),
                    highlightWord: NSLocalizedString("Premium", comment: ""),
                    lowerHeader: NSLocalizedString("features", comment: "Paywall title part 2"),
                    firstLine: NSLocalizedString("Easily share and display the, annotations,", comment: "Paywall subtitle line 1"),
                    secondLine: NSLocalizedString("content of your screen!", comment: "Paywall subtitle line 2"),
                    swapColors: true
                )
                .padding(.top, 15)

                // Image
                Image("paywall2")
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, -7)
                
                // Weekly (with trial)
                if let weeklyProduct = premium.products.first(where: { $0.productId.contains("week")}) {
                    SubscriptionRowView(
                        isSelected: viewModel.selectedPlan == .weekly,
                        date: NSLocalizedString("Weekly", comment: ""),
                        description: "3 day free",
                        desctiptionColor: .gradient,
                        price: weeklyProduct.display
                    )
                    .onTapGesture {
                        viewModel.select(plan: .weekly)
                    }
                }

                // Yearly (no trial)
                if let yearlyProduct = premium.products.first(where: { $0.productId.contains("year")}) {
                    SubscriptionRowView(
                        isSelected: viewModel.selectedPlan == .yearly,
                        date: NSLocalizedString("Yearly", comment: ""),
                        description: yearlyProduct.display,
                        desctiptionColor: .gray,
                        price: yearlyProduct.weeklyEquivalentDisplay ?? yearlyProduct.display
                    )
                    .onTapGesture {
                        viewModel.select(plan: .yearly)
                    }
                }

              

                // Toggle
                    HStack {
                        Text(NSLocalizedString("Start Free Trial", comment: "Trial toggle label"))
                            .font(AppFonts.vietnam16SemiBold)
                            .foregroundColor(.white)
                        Spacer()
                        Toggle("", isOn: $viewModel.enableTrial)
                            .labelsHidden()
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                
                
                // Continue
                Button(action: {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    viewModel.continueTapped()
                }) {
                    Text(viewModel.enableTrial
                         ? NSLocalizedString("Try for Free", comment: "")
                         : NSLocalizedString("Continue", comment: "Continue button"))
                        .font(AppFonts.vietnam18SemiBold)
                        .foregroundColor(.white)
                        .frame(width: 344, height: 70)
                        .background(AppColor.peachGradient)
                        .cornerRadius(20)
                        .shadow(color: AppColor.peachColor.opacity(0.27), radius: 11.3, x: 0, y: 10)
                }
                .padding(.top, 5)

                // Footer
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
                .font(AppFonts.vietnam18SemiBold)
                .foregroundColor(.gray)
                .padding(.top, 20)
                .padding(.horizontal, 15)
            }
        }
        
    }
}
