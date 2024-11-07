//
//  ErrorModifier.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/7/24.
//

import Foundation
import SwiftUI

struct ErrorModifier: ViewModifier {
    
    @State private var errorWrapper: ErrorWrapper?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .bottom) {
                errorWrapper != nil ? ErrorView(errorWrapper: $errorWrapper) : nil
            }
            .environment(\.showError, ShowErrorAction(action: showError))
    }
    
    private func showError(error: Error, guidance: String) {
        errorWrapper = ErrorWrapper(error: error, guidance: guidance)
    }
}
