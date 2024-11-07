//
//  View+Extensions.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/7/24.
//

import Foundation
import SwiftUI

extension View {
    
    func withErrorView() -> some View {
        modifier(ErrorModifier())
    }
    
}
