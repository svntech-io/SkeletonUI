//
//  ModifiedContent+SkeletonBackgroundModifier.swift
//  
//
//  Created by Alexandr Mavrichev on 12.02.23.
//

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public extension ModifiedContent where Content: View, Modifier == SkeletonBackgroundModifier {
    func animation(type: AnimationType) -> ModifiedContent<Content, SkeletonBackgroundModifier> {
        modifier.skeleton.animation.type.send(type)
        return self
    }

    func appearance(type: AppearanceType) -> ModifiedContent<Content, SkeletonBackgroundModifier> {
        modifier.skeleton.appearance.type.send(type)
        return self
    }

    func multiline(lines: Int, scales: [Int: CGFloat]? = nil, spacing: CGFloat? = nil) -> ModifiedContent<Content, SkeletonBackgroundModifier> {
        modifier.skeleton.multiline.lines.send(lines)
        modifier.skeleton.multiline.scales.send(scales)
        modifier.skeleton.multiline.spacing.send(spacing)
        return self
    }

    func shape(type: ShapeType) -> ModifiedContent<Content, SkeletonBackgroundModifier> {
        modifier.skeleton.shape.type.send(type)
        return self
    }
}
