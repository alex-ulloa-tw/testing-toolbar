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
            
            //This works because this is outside the modal. if you comment lines 27-32 and uncomment lines 45-52 that won't work, unless you uncomment lines 60-67
            TextEditor(text: $text)
                .focused($focus)
                .frame(height: 150)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.primary, lineWidth: 1)
                )
                .padding()
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Hide") { focus = false }
                    }
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
            // This does not work because you are in a fullScreenCover.
            //                .toolbar {
            //                    ToolbarItemGroup(placement: .keyboard) {
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
        // If you add this here it will work. But then the toolbar will open in all keyboards
        //        .toolbar {
        //            ToolbarItemGroup(placement: .keyboard) {
        //                Spacer()
        //                Button("Hide") { focus = false }
        //            }
        //        }
    }
}
