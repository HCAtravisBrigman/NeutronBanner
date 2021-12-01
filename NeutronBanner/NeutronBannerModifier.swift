//
//  NeutronBannerModifier.swift
//  NeutronBanner
//
//  Created by UXCOE Floater on 11/1/21.
//

import SwiftUI
import Neutron

struct NeutronBannerModifier: ViewModifier {
    
    struct BannerData {
        var title:String?
        var detail:String?
        var type: BannerType
    }
    
    enum BannerType {
        case Neutral
        case Success
        case Error
        
        var backgroundColor: Color {
            switch self {
            case .Neutral:
                return Color.hcaBlue10
            case .Success:
                return Color.hcaGreen10
            case .Error:
                return Color.hcaRed10
            }
        }
        
        var textColor: Color {
            switch self {
            case .Neutral:
                return Color.hcaBlue80
            case .Success:
                return Color.hcaGreen80
            case .Error:
                return Color.hcaRed80
            }
        }
        
        var icon: Image {
            switch self {
            case .Neutral, .Success:
                return Image(systemName: "checkmark.circle.fill")
            case .Error:
                return Image(systemName: "exclamationmark.circle.fill")
            }
        }
    }
    @Binding var show:Bool
    @Binding var data:BannerData
    
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                HStack {
                    data.type.icon
                    VStack(alignment: .leading, spacing: 2) {
                        
                        if let messageTitle = data.title {
                            Text(messageTitle)
                                .bold()
                        }
                        if let messageDetail = data.detail {
                        Text(messageDetail)
                            .font(Font.system(size: 15, weight: Font.Weight.light, design: Font.Design.default))
                        }
                    }
                    Spacer()
                }
                .foregroundColor(data.type.textColor)
                .padding(12)
                .background(data.type.backgroundColor)
                .cornerRadius(8)
                .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(data.type.textColor, lineWidth: 2)
                    )
                Spacer()
            }
            .padding()
        }
    }
    
}

struct NeutronBannerModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
    }
}

