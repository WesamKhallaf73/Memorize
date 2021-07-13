//
//  ContentView.swift
//  Memorize
//
//  Created by Wesam Khallaf on 04/07/2021.
//

import SwiftUI

struct ContentView: View {
    @State var emojiesCount = 18
    let emojis = ["✈️" , "🚇" ,  "🚘"  ,"🛳"  , "🚙", "🚆" ,"🚲 ","🚅" ,"🚜","🚝","🚌","🦽","🚀","🛻 ","🏍" ,"🛵","🚡", "🛰"]
    
    
    var body: some View {
        
        
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100 ))])
                {
                    
                    ForEach( emojis[0...emojiesCount - 1 ] , id: \.self  ) {emoji in
                        CardView(content: emoji).aspectRatio(2/3,contentMode:.fit)
                    }
                    
                }
            }.foregroundColor(.red)
            
            Spacer()
            
            HStack {
                Add
                Spacer()
                remove
            }.padding(.horizontal)
            .font(.largeTitle)
        }.padding(.horizontal)
        
    }
    
    var remove : some View {
        Button {
            if  (emojiesCount > 1) {
                emojiesCount -= 1
                
            }
        }
        label : {Image(systemName: "minus.circle")
            
        }
    }
    var Add : some View {
        Button {
            if  emojiesCount < emojis.count {
                emojiesCount += 1
            }
        } label: {Image(systemName: "plus.circle")
            
        }
    }
}


struct CardView : View {
    var content : String
    @State var isFaceUp : Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if (isFaceUp) {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth : 3)
                Text(content).font(.largeTitle)
                
            }
            else {
                shape.fill()
                
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        // .preferredColorScheme(.dark)
        /// ContentView()
        // .preferredColorScheme(.light)
        
        
    }
}
