import SwiftUI

struct ChangeIconView: View {
    @Environment(\.dismiss) private var dismiss
    
    var onFirstIconTap: () -> Void
    var onSecondIconTap: () -> Void
    var onCloseTap: () -> Void
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Header
            ZStack {
                Text("Change icon")
                    .font(AppFonts.vietnam26Bold)
                    .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    Button {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        onCloseTap()
                    } label: {
                        ZStack {
                            Circle()
                                .fill(.white.opacity(0.08))
                                .frame(width: 25, height: 25)
                            
                            Image(systemName: "xmark")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundStyle(.white)
                        }
                    }
                }
                .padding(.trailing, 16)
            }
            .padding(.horizontal)
            .padding(.top, 25)
            
            Spacer()
            
            // MARK: - Icons
            HStack(spacing: 20) {
                Button(action: {
                    UIImpactFeedbackGenerator(style: .light).impactOccurred()
                    onFirstIconTap()
                    dismiss()
                }) {
                    VStack(spacing: 8) {
                        Image("icon1")
                            .resizable()
                            .frame(width: 160, height: 160)
                            .cornerRadius(20)
                    }
                }

                Button(action: {
                    onSecondIconTap()
                    dismiss()
                }) {
                    VStack(spacing: 8) {
                        Image("icon2")
                            .resizable()
                            .frame(width: 160, height: 160)
                            .cornerRadius(20)
                    }
                }
            }
            .padding(.bottom, 20)
            
            Spacer()
        }
        .background(AppColor.lightDarkGradient)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.42)
        //.shadow(color: Color.black.opacity(0.07), radius: 5, x: 0, y: 4)
        .cornerRadius(25)
    }
}


