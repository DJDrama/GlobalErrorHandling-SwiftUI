//
//  ContentView.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/6/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.showError) private var showError
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Button("Throw Error") {
                showError(SampleError.operationFailed, "Operation has failed. Please try again later.")
            }
            
            NavigationLink("Detail Screen"){
                DetailScreen()
            }
        }
        .navigationTitle("ContentView")
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing){
                Button("Open Sheet") {
                    isPresented = true
                }
            }
        })
        .sheet(isPresented: $isPresented, content: {
            DetailScreen()
                .withErrorView()
        })
        .padding()
    }
}

// ContentViewContainer is only created so our Previews can work
struct ContentViewContainer: View {
    
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some View {
        NavigationStack{
            ContentView()
        }.withErrorView()
        /*
        .environment(\.showError, ShowErrorAction(action: showError))
        .overlay(alignment: .bottom) {
            errorWrapper != nil ? ErrorView(errorWrapper: $errorWrapper) : nil
        }
         */
    }
    
    private func showError(error: Error, guidance: String) {
        errorWrapper = ErrorWrapper(error: error, guidance: guidance)
    }
}

#Preview {
    ContentViewContainer()
}
