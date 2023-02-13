import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct SkeletonBackgroundModifier: ViewModifier {
    let skeleton: SkeletonInteractable
    @State var animation: Bool = false

    public func body(content: Content) -> some View {
        if skeleton.presenter.loading {
            content
                .opacity(0.0)
                .background(SkeletonView(skeleton: skeleton, line: 1)
                    .frame(height: skeleton.presenter.size?.height)
                    .onReceive([animation].publisher.filter { $0 }.removeDuplicates().first()) { _ in
                        withAnimation(skeleton.animation.position.presenter.animation) {
                            skeleton.animation.position.value.send(skeleton.animation.position.presenter.range.upperBound)
                        }
                        withAnimation(skeleton.animation.opacity.presenter.animation) {
                            skeleton.animation.opacity.value.send(skeleton.animation.opacity.presenter.range.upperBound)
                        }
                        withAnimation(skeleton.animation.radius.presenter.animation) {
                            skeleton.animation.radius.value.send(skeleton.animation.radius.presenter.range.upperBound)
                        }
                        withAnimation(skeleton.animation.angle.presenter.animation) {
                            skeleton.animation.angle.value.send(skeleton.animation.angle.presenter.range.upperBound)
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            animation = true
                        }
                    }
                    .onDisappear {
                        DispatchQueue.main.async {
                            animation = false
                        }
                    })
        } else {
            content
        }
    }
}
