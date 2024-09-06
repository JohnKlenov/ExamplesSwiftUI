//
//  RequirementText.swift
//  SwiftUIProject
//
//  Created by Evgenyi on 5.09.24.
//

import SwiftUI

struct RequirementText: View {
    var iconName: String = "xmark.square"
    var iconColor = Color(red: 251/255, green: 128/255, blue: 128/255)
    
    var text = "minimum 4 characters"
    var isStrikeThrough = false
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundStyle(iconColor)
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(Color(uiColor: UIColor.secondaryLabel))
                .strikethrough(isStrikeThrough)
            Spacer()
                
        }
    }
}

#Preview {
    RequirementText()
}
