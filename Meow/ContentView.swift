import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(.haku)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 64.0))
                    .padding()
                Button(action: {}) {
                    Text("Generator Button Text")
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.black, lineWidth: 1)
                        )
                        .foregroundColor(.black)
                }
            }
            .navigationTitle("Navigation Title Text")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
