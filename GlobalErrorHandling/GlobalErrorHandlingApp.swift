//
//  GlobalErrorHandlingApp.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/6/24.
//

import SwiftUI

@main
struct GlobalErrorHandlingApp: App {
    @State private var errorWrapper: ErrorWrapper?
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
            }.environment(\.showError, ShowErrorAction(action: showError))
                .overlay(alignment: .bottom) {
                    errorWrapper != nil ? ErrorView(errorWrapper: $errorWrapper) : nil
                }
        }
    }
    private func showError(error: Error, guidance: String) {
        errorWrapper = ErrorWrapper(error: error, guidance: guidance)
    }
}
