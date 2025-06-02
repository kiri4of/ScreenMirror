import SwiftUI

struct ExplorePremiumView: View {
    
    var didTap: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Image
            Image("explorePremium")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 130)
                .cornerRadius(20)
                .clipped()
                
            // Text and arrow
            HStack {
                Spacer()
                VStack(alignment: .leading, spacing: 8) {
                    Text("Explore Premium")
                        .font(AppFonts.vietnam18Medium)
                        .foregroundColor(.white)

                    Text("Unlock all features")
                        .font(AppFonts.vietnam16Regular)
                        .foregroundColor(.white.opacity(0.85))
                        .multilineTextAlignment(.leading)
                    
                    Button {
                        didTap()
                    } label: {
                        Text("Start now")
                            .font(AppFonts.vietnam16Bold)
                            .foregroundColor(.black)
                            .frame(width: 110, height: 33)
                            .background(.white)
                            .cornerRadius(10)
                            .shadow(color: .white.opacity(0.3), radius: 9.8, x: 0, y: 2)
                    }
                }
            }
            .padding(.leading, 30)
            .padding(.trailing, 22)
        }
        .frame(height: 130)
        .padding(.horizontal, 20)
    }
}

