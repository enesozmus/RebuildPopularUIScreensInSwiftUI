//
//  RebuildPopularUIScreensApp.swift
//  RebuildPopularUIScreens
//
//  Created by enesozmus on 8.06.2024.
//

import SwiftfulRouting
import SwiftUI

@main
struct RebuildPopularUIScreensInSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
