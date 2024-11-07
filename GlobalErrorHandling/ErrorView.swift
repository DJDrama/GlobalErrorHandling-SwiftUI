//
//  ErrorView.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/7/24.
//

import SwiftUI

struct ErrorView: View {
    
    @Binding var errorWrapper: ErrorWrapper?
    
    var body: some View {
        VStack {
            Text(errorWrapper?.error.localizedDescription ?? "")
            Text(errorWrapper?.guidance ?? "")
        }.task(id: errorWrapper?.id) {
            // delay
            try? await Task.sleep(for: .seconds(2))
            guard !Task.isCancelled else { return }
            
            errorWrapper = nil
        }
        .foregroundStyle(.white)
        .padding()
        .background(.red)
        .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
    }
}

#Preview {
    ErrorView(errorWrapper: .constant(ErrorWrapper(error: SampleError.operationFailed,
                                                   guidance: "Operation failed. Please try again later.")))
}
