import SwiftUI

struct MainTabView: View {
    @State var selectedTab: Tab = .home
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var showEnableSheet = false
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .home:
                HomeView(viewModel: homeViewModel)
                    .environmentObject(PremiumViewModel.shared)
            case .settings:
                EmptyView()
            }
            
            //Tab bar
            VStack {
                Spacer()
                CustomTabBarView(selectedTab: $selectedTab) {
                    withAnimation(.easeInOut) {
                        showEnableSheet = true
                    }
                }
            }
            
            if showEnableSheet {
                
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation { showEnableSheet = false }
                    }
                
                VStack {
                    Spacer()
                    EnableScreenMirrorSheetView {
                        withAnimation { showEnableSheet = false }
                    }
                    .transition(.move(edge: .bottom))
                }
                .ignoresSafeArea()
                .zIndex(10)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

