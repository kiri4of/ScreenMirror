
import SwiftUI

struct SettingsRow: View {
    let title: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        
        Button {
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
            action()
        } label: {
            HStack(spacing: 20) {
                
                Image(image)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 15)
                
                
                Text(title)
                    .foregroundStyle(.white)
                    .font(AppFonts.vietnam18Bold)
                    .lineLimit(1)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 75)
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .fill(AppColor.lightDarkGradient )
                //shadow that creates a ‘convex’ effect
                    .shadow(color: Color.black.opacity(0.04), radius: 30, x: 0, y: 4)
            )
        }
        .padding(.horizontal, 20)
    }
}
