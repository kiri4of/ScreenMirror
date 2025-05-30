
import SwiftUI

struct EnableScreenMirrorSheetView: View {
    
    var onDismiss: () -> Void
    
    var body: some View {
        VStack(spacing: 8) {
            //Header
            ScreenMirrorDescriptionView(upperHeader: "How to Enable",
                                      highlightWord: "Control Center",
                                      secondHighlightWord: "Screen Mirroring",
                                      lowerHeader: "Screen Mirroring",
                                      firstLine: "Go to Control Center and",
                                      secondLine: "choose Screen Mirroring")
            .padding(.top, 10)
            
            //Image
            Image("iphoneControlCentre")
                .resizable()
                .scaledToFit()
                .padding(.bottom, -10)
            
            VStack(spacing: 23) {
                Button(action: {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    onDismiss()
                }) {
                    Text("I got it")
                        .font(AppFonts.vietnam18SemiBold)
                        .foregroundColor(.white)
                        .frame(width: 344, height: 69)
                        .background(AppColor.peachGradient)
                        .cornerRadius(16)
                        .shadow(color: AppColor.peachShadowColor, radius: 21.3, x: 0, y: 5)
                }
                
                Button {
                    onDismiss()
                } label: {
                    Text("Later")
                        .font(AppFonts.vietnam16SemiBold)
                        .foregroundStyle(.gray)
                }
            }
            .padding(.bottom, 20)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: UIScreen.main.bounds.height * 0.80)
        .background(AppColor.lightDarkGradient)
        .cornerRadius(20)
    }
}
