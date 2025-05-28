
import SwiftUI

struct OnboardingDescriptionView: View {
    let upperHeader: String
    let highlightWord: String
    let lowerHeader: String
    let firstLine: String
    let secondLine: String
    var swapColors: Bool = false
    
    var body: some View {
        VStack {
            Text(changeWordColor(upperHeader))
                .font(AppFonts.vietnam34Bold)
                
            Text(changeWordColor(lowerHeader))
                .font(AppFonts.vietnam34Bold)
                .padding(.bottom, 7)
            
            VStack(spacing: 4) {
                Text(firstLine)
                    .foregroundColor(AppColor.descriptionColor)
                    .font(AppFonts.vietnam14SemiBold)
                
                Text(secondLine)
                    .foregroundColor(AppColor.descriptionColor)
                    .font(AppFonts.vietnam14SemiBold)
            }
        }
        .padding()
    }
    
    func changeWordColor(_ string: String) -> AttributedString {
        var attrString: AttributedString {
            var attrString = AttributedString(string)
            attrString.foregroundColor = .white
            
            if let range = attrString.range(of: highlightWord) {
                attrString[range].foregroundColor = AppColor.peachColor
            }
            
            return attrString
        }
        return attrString
    }
}

