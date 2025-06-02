
import SwiftUI

struct FAQView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            
            AppColor.backgroundGradient.ignoresSafeArea()
            
            GlowingCircle(offsetX: -132, offsetY: -350)
            GlowingCircle(offsetX: 132, offsetY: 350)
            
            VStack {
                ZStack {
                    Text(NSLocalizedString("FAQ", comment: ""))
                        .font(AppFonts.vietnam26Bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 20)
                    
                    HStack {
                        Spacer()
                        Button {
                            UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            dismiss()
                        } label: {
                            ZStack {
                                Circle()
                                    .fill(.white.opacity(0.08))
                                    .frame(width: 38, height: 38)
                                
                                Image(systemName: "xmark")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .padding(.trailing, 20)
                }
                
                VStack(alignment: .leading, spacing: 25) {
                    FAQRowView(
                           title: NSLocalizedString("Devices are on the same network but can't connect", comment: ""),
                           details: [
                               "Try turning on Airplane Mode on one device for 5 seconds, then turn it off.",
                               "If that doesn’t help, restart your router and both devices.",
                               "Make sure all devices are updated to the latest software version.",
                               "If you have more than one Wi-Fi network, try connecting both devices to a different one and check if the app detects your TV."
                           ]
                       )

                       FAQRowView(
                           title: NSLocalizedString("Screen mirror doesn't work", comment: ""),
                           details: [
                               "Make sure your iOS device is connected to Wi-Fi.",
                               "Restart your TV by unplugging the power cord, waiting for 1 minute, then plugging it back in. Note: After turning the TV back on, it may take 30–60 seconds before it’s detectable by your device.",
                               "Close and reopen the app: Swipe up from the bottom, then swipe up on the \("Screen Mirror") preview to fully close it."
                           ]
                       )

                       FAQRowView(
                           title: NSLocalizedString("How to manage subscription", comment: ""),
                           details: [
                               "Open the Settings app.",
                               "Tap your Apple ID at the top.",
                               "Select Subscriptions and manage the app from the list."
                           ]
                       )
                }
                
                Spacer()
            }
        }
    }
    
    
    private var headerSection: some View {
        HStack {
            Text(NSLocalizedString("Screen Mirroring", comment: "Main screen title"))
                .foregroundStyle(.white)
                .font(AppFonts.vietnam26Bold)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            
            Spacer()
        }
    }
}


