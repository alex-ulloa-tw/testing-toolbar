import SwiftUI

struct ContentView: View {
    @State private var text = ""
    @FocusState private var focus: Bool
    @State private var showFullScreenCover = false
    
    var body: some View {
        VStack {
            Text("Testing...")
            Button(action: {
                showFullScreenCover = true
            }) {
                Text("Open modal")
            }
        }.fullScreenCover(isPresented: $showFullScreenCover) {
            TextEditor(text: $text)
                .focused($focus)
                .frame(height: 150)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.primary, lineWidth: 1)
                )
                .padding()
//                .toolbar {
//                    ToolbarItemGroup(placement: .keyboard) {
//                        Button("Shrug") { text += "\n¯\\_(ツ)_/¯" }
//                        Button("Flip") { text += "\n(╯°□°）╯︵ ┻━┻" }
//                        Spacer()
//                        Button("Hide") { focus = false }
//                    }
//                }
            
            
            Button(action: {
                showFullScreenCover = false
            }) {
                Text("Close modal")
            }
            
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Button("Shrug") { text += "\n¯\\_(ツ)_/¯" }
                Button("Flip") { text += "\n(╯°□°）╯︵ ┻━┻" }
                Spacer()
                Button("Hide") { focus = false }
            }
        }
    }
}
