//
//  ContentView.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.showError) private var showError
    
    var body: some View {
        VStack {
            Button("Throw Error") {
                showError(SampleError.operationFailed, "Operation has failed. Please try again later.")
            }
            
            NavigationLink("Detail Screen"){
                DetailScreen()
            }
        }
        .padding()
    }
}

// ContentViewContainer is only created so our Previews can work
struct ContentViewContainer: View {
    
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some View {
        NavigationStack{
            ContentView()
        }
        .environment(\.showError, ShowErrorAction(action: showError))
        .sheet(item: $errorWrapper){ errorWrapper in
           ErrorView(errorWrapper: errorWrapper)
        }
    }
    
    private func showError(error: Error, guidance: String) {
        errorWrapper = ErrorWrapper(error: error, guidance: guidance)
    }
}

#Preview {
    ContentViewContainer()
}
