
import SwiftUI

struct OnboardingDescriptionView: View {
    let upperHeader: String
    let lowerHeader: String
    let firstLine: String
    let secondLine: String
    var swapColors: Bool = false
    
    var body: some View {
        VStack {
            Text(upperHeader)
                .font(AppFonts.vietnam34Bold)
                .foregroundStyle(swapColors ? .black : AppColor.peachColor)
            
            Text(lowerHeader)
                .font(AppFonts.vietnam34Bold)
                .foregroundStyle(swapColors ? AppColor.peachColor : .black)
                .padding(.bottom, 7)
            
            VStack(spacing: 4) {
                Text(firstLine)
                    .foregroundColor(.secondary)
                    .font(AppFonts.vietnam16SemiBold)
                
                Text(secondLine)
                    .foregroundColor(.secondary)
                    .font(AppFonts.vietnam16SemiBold)
            }
        }
        .padding()
    }
}

