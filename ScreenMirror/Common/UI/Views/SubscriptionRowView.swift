
import SwiftUI

enum RowViewColor {
    case gray
    case gradient
}

struct SubscriptionRowView: View {
    let isSelected: Bool
    let date: String
    let description: String
    let desctiptionColor: RowViewColor
    let price: String
    
    var body: some View {
        HStack {
            // RadioButton
            RadioButton(isSelected: isSelected)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(date)
                    .font(AppFonts.vietnam16SemiBold)
                    .foregroundStyle(.white)
                
                switch desctiptionColor {
                case .gray:
                    Text(description)
                    .font(AppFonts.vietnam14SemiBold )
                    .foregroundStyle(Color.gray)
                case .gradient:
                    Text(description)
                    .font(AppFonts.vietnam14SemiBold )
                    .foregroundStyle(AppColor.peachGradient)
                }
                
            }
            .padding(.leading, 10)
            
            Spacer()
            
            Text(price)
                .font(AppFonts.vietnam16Regular)
                .foregroundStyle(.white)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(AppColor.lightDarkGradient)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        )
        .overlay(
            Group {
                if isSelected {
                    AppColor.peachGradient
                        .mask(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 3)
                        )
                } else {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.clear, lineWidth: 3)
                }
            }
        )
        .padding(.horizontal)
    }
}
