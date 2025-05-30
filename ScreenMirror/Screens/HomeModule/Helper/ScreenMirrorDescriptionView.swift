
import SwiftUI

struct ScreenMirrorDescriptionView: View {
    let upperHeader: String
    let highlightWord: String
    let secondHighlightWord: String
    let lowerHeader: String
    let firstLine: String
    let secondLine: String
    var swapColors: Bool = false
    
    var body: some View {
        VStack {
            Text(upperHeader)
                .foregroundColor(.white)
                .font(AppFonts.vietnam24Bold)
                
            Text(lowerHeader)
                .foregroundColor(.white)
                .font(AppFonts.vietnam24Bold)
                .padding(.bottom, 7)
            
            VStack(spacing: 4) {
                Text(changeWordColor(firstLine))
                    .foregroundColor(AppColor.descriptionColor)
                    .font(AppFonts.vietnam18Medium)
                
                Text(changeWordColor(secondLine))
                    .foregroundColor(AppColor.descriptionColor)
                    .font(AppFonts.vietnam18Medium)
            }
        }
        .padding()
    }
    
    func changeWordColor(_ string: String) -> AttributedString {
        var attrString: AttributedString {
            var attrString = AttributedString(string)
            attrString.foregroundColor = .gray
            
            if let range = attrString.range(of: highlightWord) {
                attrString[range].foregroundColor = AppColor.peachColor
            }
            
            if let secondRange = attrString.range(of: secondHighlightWord) {
                attrString[secondRange].foregroundColor = AppColor.peachColor
            }
            
            return attrString
        }
        return attrString
    }
}

