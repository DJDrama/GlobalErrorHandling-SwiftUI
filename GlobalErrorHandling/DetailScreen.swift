//
//  DetailScreen.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/7/24.
//

import SwiftUI

struct DetailScreen: View {
    
    @Environment(\.showError) private var showError
    
    var body: some View {
        Button("Throw Error from Detail Screen"){
            showError(SampleError.operationFailed, "Operation failed in Detail View")
        }
    }
}

#Preview {
    DetailScreen()
}
