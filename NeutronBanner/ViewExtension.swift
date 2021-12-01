//
//  ViewExtension.swift
//  NeutronBanner
//
//  Created by UXCOE Floater on 11/1/21.
//

import Foundation
import SwiftUI

extension View {
    func banner(data: Binding<NeutronBannerModifier.BannerData>, show: Binding<Bool>) -> some View {
        self.modifier(NeutronBannerModifier(show: show, data: data))
    }
}
