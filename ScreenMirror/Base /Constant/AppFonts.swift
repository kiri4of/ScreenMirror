import SwiftUI

enum BeVietnamProFont {
    static func regular(size: CGFloat) -> Font {
        Font.custom("BeVietnamPro-Regular", size: size)
    }

    static func bold(size: CGFloat) -> Font {
        Font.custom("BeVietnamPro-Bold", size: size)
    }

    static func semiBold(size: CGFloat) -> Font {
        Font.custom("BeVietnamPro-SemiBold", size: size)
    }

    static func medium(size: CGFloat) -> Font {
        Font.custom("BeVietnamPro-Medium", size: size)
    }
}

enum AppFonts {
    static let vietnam34Bold = BeVietnamProFont.bold(size: 34)
    static let vietnam30Bold = BeVietnamProFont.bold(size: 30)
    static let vietnam28Bold = BeVietnamProFont.bold(size: 28)
    static let vietnam26Bold = BeVietnamProFont.bold(size: 26)
    static let vietnam24Bold = BeVietnamProFont.bold(size: 24)
    static let vietnam22Bold = BeVietnamProFont.bold(size: 22)
    static let vietnam20Bold = BeVietnamProFont.bold(size: 20)
    static let vietnam18Bold = BeVietnamProFont.bold(size: 18)
    static let vietnam16Bold = BeVietnamProFont.bold(size: 16)
    static let vietnam14Bold = BeVietnamProFont.bold(size: 14)
    static let vietnam12Bold = BeVietnamProFont.bold(size: 12)
    
    static let vietnam24Regular = BeVietnamProFont.regular(size: 24)
    static let vietnam22Regular = BeVietnamProFont.regular(size: 22)
    static let vietnam18Regular = BeVietnamProFont.regular(size: 18)
    static let vietnam16Regular = BeVietnamProFont.regular(size: 16)
    static let vietnam14Regular = BeVietnamProFont.regular(size: 14)
    static let vietnam12Regular = BeVietnamProFont.regular(size: 12)
    
    static let vietnam24SemiBold = BeVietnamProFont.semiBold(size: 24)
    static let vietnam22SemiBold = BeVietnamProFont.semiBold(size: 22)
    static let vietnam20SemiBold = BeVietnamProFont.semiBold(size: 20)
    static let vietnam18SemiBold = BeVietnamProFont.semiBold(size: 18)
    static let vietnam16SemiBold = BeVietnamProFont.semiBold(size: 16)
    static let vietnam14SemiBold = BeVietnamProFont.semiBold(size: 14)
    static let vietnam12SemiBold = BeVietnamProFont.semiBold(size: 12)
    
    static let vietnam24Medium = BeVietnamProFont.medium(size: 24)
    static let vietnam20Medium = BeVietnamProFont.medium(size: 20)
    static let vietnam18Medium = BeVietnamProFont.medium(size: 18)
    static let vietnam16Medium = BeVietnamProFont.medium(size: 16)
    static let vietnam14Medium = BeVietnamProFont.medium(size: 14)
    static let vietnam12Medium = BeVietnamProFont.medium(size: 12)
}
