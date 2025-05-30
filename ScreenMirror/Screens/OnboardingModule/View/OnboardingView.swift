
import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ZStack {
            AppColor.backgroundGradient.ignoresSafeArea()
           
            GlowingCircle(offsetX: -132, offsetY: -350)
                .zIndex(1)
            
            TabView(selection: $viewModel.currentPage) {
                ForEach(0..<viewModel.pages.count, id: \.self) { index in
                    VStack {
                        OnboardingDescriptionView(
                            upperHeader: viewModel.pages[index].upperHeader, highlightWord: viewModel.pages[index].highlightWord,
                            lowerHeader: viewModel.pages[index].lowerHeader,
                            firstLine: viewModel.pages[index].firstLine,
                            secondLine: viewModel.pages[index].secondLine,
                            swapColors: !index.isMultiple(of: 2))
                        .padding(.top, 20)

                        Image(viewModel.pages[index].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(.bottom, -8)
                        
                        Button(action: {
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            viewModel.nextButtonTapped()
                        }) {
                            Text("Continue")
                                .font(AppFonts.vietnam18SemiBold)
                                .foregroundColor(.white)
                                .frame(width: 344, height: 68)
                                .background(AppColor.peachGradient)
                                .cornerRadius(16)
                                .shadow(color: AppColor.peachShadowColor, radius: 21.3, x: 0, y: 5)
                        }

                        
                        HStack(spacing: 55) {
                            Button("Privacy") {
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                viewModel.openPrivacyPolicy()
                            }
                         
                            Button("Restore") {
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                //PremiumViewModel.shared.restore()
                            }
                            
                            Button("Terms") {
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                                viewModel.openTermsOfUse()
                            }
                        }
                        .font(AppFonts.vietnam16SemiBold)
                        .foregroundColor(.gray)
                        .padding(.top, 15)
                    }
                }
            }
            .background(AppColor.backgroundGradient)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}


