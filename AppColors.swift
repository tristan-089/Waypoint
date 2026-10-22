import SwiftUI

extension Color {
    init(hex: UInt32) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: 1
        )
    }
}

enum AppColors {
    static let background = Color(hex: 0x101820)
    static let card = Color(hex: 0x1C2935)
    static let mint = Color(hex: 0x75D6C2)
    static let steelBlue = Color(hex: 0x8DA7BE)
    static let gold = Color(hex: 0xE8C982)
    static let coral = Color(hex: 0xE58D91)

    static let text = Color(hex: 0xF4F7FA)
    static let secondaryText = Color(hex: 0xA7B5C2)
}
