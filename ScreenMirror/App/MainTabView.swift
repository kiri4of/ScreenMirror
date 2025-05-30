import SwiftUI

struct MainTabView: View {
    @State var selectedTab: Tab = .home
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home:
                HomeView(viewModel: homeViewModel)
                .environmentObject(PremiumViewModel.shared)
            case .cast:
                EmptyView()
            case .settings:
                EmptyView()
            }
            
            VStack {
                Spacer()
                CustomTabBarView(selectedTab: $selectedTab)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

