//
//  ErrorView.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/7/24.
//

import SwiftUI

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        Text(errorWrapper.error.localizedDescription)
        Text(errorWrapper.guidance)
    }
}

#Preview {
    ErrorView(errorWrapper: ErrorWrapper(error: SampleError.operationFailed, guidance: "Operation failed. Please try again later."))
}
