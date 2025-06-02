import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var premium: PremiumViewModel
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    AppColor.backgroundGradient.ignoresSafeArea()
                    
                    GlowingCircle(offsetX: -132, offsetY: -350)
                    GlowingCircle(offsetX: 132, offsetY: 350)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        // Header
                            Text(NSLocalizedString("Settings", comment: "Settings screen title"))
                                .font(AppFonts.vietnam26Bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 20)
                                .padding(.leading, 20)

                        
                        // Banner
                        if !premium.premium {
                                ExplorePremiumView {
                                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                        viewModel.showPaywall = true
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.bottom, 20)
                               
                        }
                       
                        
                        // Settings rows
                        VStack(alignment: .leading, spacing: 20) {
                            // 1) FAQ
                            SettingsRow(title: NSLocalizedString("FAQ", comment: "Share link setting"), image: "faqImage") {
                                viewModel.showFAQSheet = true
                            }
                            
                            // 2) Change icon
                            SettingsRow(title: NSLocalizedString("Change icon", comment: "Switch app icon setting"), image: "changeIconImage") {
                                viewModel.showIconMenu = true
                            }
                            
                            // 3) Terms of Use
                            SettingsRow(title: NSLocalizedString("Privacy policy", comment: "Terms of Use setting"), image: "privacyImage") {
                                viewModel.openTermsOfUse()
                            }
                            
                            // 4) Privacy Policy
                            SettingsRow(title: NSLocalizedString("Terms of use", comment: "Privacy Policy setting"), image: "termsImage") {
                                viewModel.openPrivacyPolicy()
                            }
                        }
                        Spacer()
                    }
                }
               
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
            if viewModel.showIconMenu {
                ZStack {
                    // затемнённый фон-заглушка
                    CustomDimmedBackdropView {
                        withAnimation {
                            viewModel.showIconMenu = false
                        }
                    }
                    .ignoresSafeArea()

                    // сама карточка-шторка
                    VStack {
                        Spacer()                    // ← один Spacer прижимает вниз

                        ChangeIconView(
                            onFirstIconTap: {
                                viewModel.changeAppIcon(to: "AppIcon 1")
                                viewModel.showIconMenu = false
                            },
                            onSecondIconTap: {
                                viewModel.changeAppIcon(to: "AppIcon 2")
                                viewModel.showIconMenu = false
                            },
                            onCloseTap: {
                                viewModel.showIconMenu = false
                            }
                        )
                        .background(AppColor.lightDarkGradient)
                        .cornerRadius(20)
                    }
                    .transition(.move(edge: .bottom))
                    .ignoresSafeArea()
                }
            }
        }
        .sheet(isPresented: $viewModel.showPaywall) {
            PayWallView(viewModel: PayWallViewModel())
                .environmentObject(PremiumViewModel.shared)
        }
        .fullScreenCover(isPresented: $viewModel.showFAQSheet) {
            FAQView()
        }
        .animation(.easeInOut, value: viewModel.showIconMenu)
    }
}

