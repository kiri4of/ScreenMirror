
import SwiftUI

struct Category {
    let id: Int
    let text: String
    let image: String
}

struct CategoryCell: View {
    let category: Category

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image(category.image)
                .resizable()
                .frame(width: 80, height: 80)

            Text(category.text)
                .font(AppFonts.vietnam22Bold)
                .foregroundStyle(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppColor.lightDarkGradient)
        .cornerRadius(20)
    }
}



