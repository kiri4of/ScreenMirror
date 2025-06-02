
import SwiftUI

struct BackdropView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView()
        let blur = UIBlurEffect()
        
        // Animator creates UIBlurEffect, but fractionComplete = 0 stop tha animation
        let animator = UIViewPropertyAnimator()
        animator.addAnimations { view.effect = blur }
        animator.fractionComplete = 0
        animator.stopAnimation(false)
        animator.finishAnimation(at: .current)
        
        return view
    }
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

struct BackdropBlurView: View {
    let radius: CGFloat
    var body: some View {
        BackdropView().blur(radius: radius)
    }
}

//setup the values if needed
struct CustomDimmedBackdropView: View {
    var onTap: () -> Void
    let blackOpacity: CGFloat = 0.2
    let blurRadius: CGFloat = 5.0
    
    var body: some View {
        ZStack {
            Color.black.opacity(blackOpacity)
                .ignoresSafeArea()
            
            BackdropBlurView(radius: blurRadius)
                .ignoresSafeArea()
        }
        .onTapGesture {
            onTap()
        }
    }
}
