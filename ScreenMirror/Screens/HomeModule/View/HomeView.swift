
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @EnvironmentObject var premium: PremiumViewModel
    
    var body: some View {
        ZStack {
            AppColor.backgroundGradient.ignoresSafeArea()
            
            GlowingCircle(offsetX: -132, offsetY: -350)
            GlowingCircle(offsetX: 132, offsetY: 350)
            
            VStack {
                headerSection
                
                if !premium.premium {
                    Button {
                        UIImpactFeedbackGenerator(style: .light).impactOccurred()
                        viewModel.showPaywall = true
                    } label: {
                        InvoiceView()
                    }
                }
                
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)) {
                    ForEach(viewModel.data, id: \.id) { category in
                        CategoryCell(category: category)
                            .frame(height: 160)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .sheet(isPresented: $viewModel.showPaywall) {
            PayWallView(viewModel: PayWallViewModel())
                .environmentObject(PremiumViewModel.shared)
        }
    }
    
    private var headerSection: some View {
        HStack {
            Text(NSLocalizedString("Screen Mirroring", comment: "Main screen title"))
                .foregroundStyle(.white)
                .font(AppFonts.vietnam26Bold)
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            
            Spacer()
        }
    }
    
    
}

