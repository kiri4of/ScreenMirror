
import SwiftUI

enum Tab {
    case home
    case settings
}

struct CustomTabBarView: View {
    
    @Binding var selectedTab: Tab
    
    var onCastTap: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(.white.opacity(0.04))
                .frame(height: 120)
                .cornerRadius(20)
            
            HStack {
                tabButton(.home, systemImage: "homeSVG", label: "home")
                
                Spacer()
                
                tabButton(.settings, systemImage: "settingsSVG", label: "settings")
                
            }
            .padding(.horizontal, 60)
            .padding(.bottom, 15)
            
            //Central actionbutton
            
            Button {
                onCastTap()
            } label: {
                ZStack {
                    
                    Circle()
                        .fill(AppColor.peachGradient)
                        .frame(width: 80, height: 80)
                        .shadow(color: AppColor.peachShadowColor, radius: 21.3, x: 0, y: 5)
                    
                    Image("screenImage")
                        
                }
            }
            .offset(y: -45)
        }
        .padding(.bottom, -35)
    }
    //Background
    
    private func tabButton(_ tab: Tab, systemImage: String, label: String) -> some View {
        Button {
            selectedTab = tab
        } label: {
            VStack(spacing: 5){
                Image(systemImage) 
                    .renderingMode(.template)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(selectedTab == tab ? AnyShapeStyle(AppColor.peachGradient) : AnyShapeStyle(Color.gray))
             
                
                Text(label)
                    .font(AppFonts.vietnam14Regular)
                    .foregroundStyle(selectedTab == tab ? AnyShapeStyle(AppColor.peachGradient) : AnyShapeStyle(Color.gray))
            }
        }
    }
}


