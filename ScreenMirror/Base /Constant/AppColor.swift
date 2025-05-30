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
    
    static let descriptionColor = Color(
        .sRGB,
        red: 149.0 / 255.0,
        green: 149.0 / 255.0,
        blue: 149.0 / 255.0,
        opacity: 1.0
    )
    
    static let grayCustom = Color(
        .sRGB,
        red: 68.0 / 255.0,
        green: 68.0 / 255.0,
        blue: 68.0 / 255.0
    )
    
    static var lightDarkGradient: LinearGradient {
         LinearGradient(
             gradient: Gradient(colors: [
                 Color(red: 35/255, green: 35/255, blue: 35/255),
                 Color(red: 15/255, green: 15/255, blue: 15/255)
             ]),
             startPoint: .top,
             endPoint: .bottom
         )
     }
    
    static var lightDarkGradient2: LinearGradient {
         LinearGradient(
             gradient: Gradient(colors: [
                 Color(red: 255/255, green: 255/255, blue: 255/255),
                 Color(red: 107/255, green: 107/255, blue: 107/255)
             ]),
             startPoint: .bottom,
             endPoint: .top
         )
     }
  
    static var peachGradient: LinearGradient {
          LinearGradient(
              gradient: Gradient(colors: [
                  Color(.sRGB, red: 255/255, green: 131/255, blue: 80/255, opacity: 1),
                  Color(.sRGB, red: 255/255, green: 34/255, blue: 39/255, opacity: 1)
              ]),
              startPoint: .leading,
              endPoint: .trailing
          )
      }
    
    static var backgroundGradient: LinearGradient {
         LinearGradient(
             gradient: Gradient(colors: [
                 Color(red: 11/255, green: 11/255, blue: 11/255),
                 Color(red: 18/255, green: 13/255, blue: 13/255)
             ]),
             startPoint: .top,
             endPoint: .bottom
         )
     }

}

