//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Robin Lin on 7/1/22.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark

    var body: some View {
        VStack(alignment: .center) {
            landmark.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(15)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
                .fontWeight(.semibold)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
