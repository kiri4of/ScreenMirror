
import SwiftUI

struct FAQRowView: View {
    
    let title: String
    let details: [String]
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                UIImpactFeedbackGenerator(style: .light).impactOccurred()
               
                    isExpanded.toggle()
                
            } label: {
                HStack(spacing: 15) {
                    Circle()
                        .fill(AppColor.peachGradient)
                        .frame(width: 12, height: 12)
                        .padding(.leading, 15)
                    
                    
                    Text(title)
                        .foregroundStyle(.white)
                        .font(AppFonts.vietnam18Medium)
                        .multilineTextAlignment(.leading)
                    
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(.white.opacity(0.08))
                            .frame(width: 29, height: 29)
                        
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    
                    .padding(.trailing, 15)
                }
                .frame(height: 85)
               
            }
            if isExpanded {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(details.indices, id: \.self) { index in
                        Text("\(index + 1). \(details[index])")
                            .font(AppFonts.vietnam14Regular)
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                //.transition(.opacity)
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(AppColor.lightDarkGradient)
        )
        .padding(.horizontal, 20)
    }
}
