
import SwiftUI

struct GradientText: View {
    var text: String

    var body: some View {
        LinearGradient(
            colors: [
                Color(red: 255/255, green: 131/255, blue: 80/255),
                Color(red: 255/255, green: 34/255, blue: 39/255)
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
        .mask(
            Text(text)
        )
    }
}
