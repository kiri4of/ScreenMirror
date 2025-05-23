import SwiftUI

enum AppColor {
    // peach
    static let peachColor = Color(
        .sRGB,
        red: 255.0 / 255.0,
        green: 131.0 / 255.0,
        blue: 80.0 / 255.0
    )
    
    static let peachShadowColor = Color(
        .sRGB,
        red: 255.0 / 255.0,
        green: 68.0 / 255.0,
        blue: 0.0 / 255.0,
        opacity: 0.55
    )
    
  
    static var peachGradient: LinearGradient {
          LinearGradient(
              gradient: Gradient(colors: [
                Color(.sRGB, red: 255/255, green: 34/255, blue: 39/255, opacity: 1),
                  Color(.sRGB, red: 255/255, green: 131/255, blue: 80/255, opacity: 1)
              ]),
              startPoint: .leading,
              endPoint: .trailing
          )
      }
    static var backgroundGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 255/255, green: 34/255, blue: 39/255),
                Color.black
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

}

