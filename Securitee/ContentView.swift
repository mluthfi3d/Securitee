//
//  ContentView.swift
//  Securitee
//
//  Created by Muhammad Luthfi on 08/09/23.
//

import SwiftUI
import SwiftKeychainWrapper

struct ContentView: View {
    @State var contentToShow = "empty"
    @State var contentToHide = ""
    @State var label = "Your text would be shown below here"
    var body: some View {
        VStack (spacing: 16) {
            VStack (spacing: 8){
                Text(label)
                    .font(.system(size: 12))
                Text(contentToShow)
                    .font(.system(size: 18))
            }
            TextField("Content to Hide", text: $contentToHide)
                .font(.system(size: 18))
                .lineLimit(4)
                .textFieldStyle(.roundedBorder)
            Button{
                KeychainWrapper.standard.set(contentToHide, forKey: "contentToHide")
                label = "Now close your app and open it again"
            } label : {
                Text("Hide")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding([.horizontal], 16)
        
        .onAppear(){
            contentToShow = KeychainWrapper.standard.string(forKey: "contentToHide") ?? "You didn't save any content"
            if contentToShow != "You didn't save any content" {
                label = "This demo provide information about SwiftKeychainWrapper that is more secure than UserDefaults to save sensitive data"
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
