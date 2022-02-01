//
//  LivingStatusView.swift
//  RickAndMorty
//
//  Created by Abhishek Tyagi on 2/1/22.
//

import SwiftUI

struct LivingStatusView: View {
    var status: LivingStatus
    
    
    var body: some View {
        Circle().foregroundColor(status.color)
            .frame(width: 15, height: 15, alignment: .leading)
            .padding(2)
    }
}

struct LivingStatusView_Previews: PreviewProvider {
    static var previews: some View {
        LivingStatusView(status: .alive)
    }
}
