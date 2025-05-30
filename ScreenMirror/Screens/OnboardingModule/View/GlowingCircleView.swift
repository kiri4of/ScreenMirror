
import SwiftUI

struct GlowingCircle: View {
    
    let offsetX: CGFloat
    let offsetY: CGFloat
    
    var body: some View {
        Circle()
            .fill(Color(red: 255/255, green: 56/255, blue: 60/255))
            .frame(width: 103, height: 103)
            .blur(radius: 90)
            .offset(x: offsetX, y: offsetY)
    }
}

