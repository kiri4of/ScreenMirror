
import SwiftUI

struct GlowingCircle: View {
    var body: some View {
        Circle()
            .fill(Color(red: 255/255, green: 56/255, blue: 60/255))
            .frame(width: 103, height: 103)
            .blur(radius: 90)
            .offset(x: -132, y: -350)
    }
}

#Preview {
    GlowingCircle()
}
