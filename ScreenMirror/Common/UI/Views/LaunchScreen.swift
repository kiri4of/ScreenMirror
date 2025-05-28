import SwiftUI

/// Full‑screen placeholder that mimics the system launch screen,.
struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            AppColor.backgroundGradient.ignoresSafeArea()
            VStack {
                Spacer()
                
                Image("launchscreen")
                    .resizable()
                    .frame(width: 188, height: 188)
                
                Spacer()
            }
        }
    }
}
