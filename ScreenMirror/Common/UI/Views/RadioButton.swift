import SwiftUI

struct RadioButton: View {
    let isSelected: Bool
    
    var body: some View {
        ZStack {
                 RoundedRectangle(cornerRadius: 6)
                .stroke(isSelected ? Color.clear : Color.gray, lineWidth: 1.5)
                     .background(
                         RoundedRectangle(cornerRadius: 6)
                            .fill(isSelected ? AnyShapeStyle(AppColor.peachGradient) : AnyShapeStyle(Color.clear))
                             .shadow(color: AppColor.peachColor.opacity(0.2),
                                     radius: 4, x: 0, y: 2)
                     )
                     .frame(width: 24, height: 24)

                 if isSelected {
                     Image(systemName: "checkmark")
                         .foregroundColor(.white)
                         .font(.system(size: 12, weight: .bold))
                 }
        }
    }
}
