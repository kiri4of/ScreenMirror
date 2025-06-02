import SwiftUI

struct InvoiceView: View {
    
    var didTap: () -> Void
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Image
            Image("invoiceImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 130)
                .cornerRadius(20)
                .clipped()
                .shadow(color: AppColor.peachShadowColor, radius: 21.3, x: 0, y: 5)

            // Text and arrow
            HStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Screen Mirroring")
                        .font(AppFonts.vietnam20Bold)
                        .foregroundColor(.white)

                    Text("Wirelessly stream from your\nphone to another screen")
                        .font(AppFonts.vietnam14Regular)
                        .foregroundColor(.white.opacity(0.85))
                        .multilineTextAlignment(.leading)
                }
                

                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.top, 70)
            }
            .padding(.leading, 40)
            .padding(.trailing, 22)
        }
        .onTapGesture {
            didTap()
        }
        .frame(height: 130)
       // .padding(.horizontal, 20)
    }
}

#Preview {
    InvoiceView(didTap: {})
}
