//
//  ContentView.swift
//  NeutronBanner
//
//  Created by UXCOE Floater on 11/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var showBanner: Bool = true
    @State var bannerData: NeutronBannerModifier.BannerData = NeutronBannerModifier.BannerData(title: "here's a title", detail: "This is the detail text for the action you just did or whatever blah blah blah blah blah", type: .Success)
    
    var body: some View {
        Text("Hello Trailing Closure")
            .banner(data: $bannerData, show: $showBanner)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
