//
//  GlobalErrorHandlingApp.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/6/24.
//

import SwiftUI

@main
struct GlobalErrorHandlingApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ContentView()
            }.withErrorView()
    
        }
    }
}
