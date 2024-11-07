//
//  ErrorWrapper.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/7/24.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    let guidance: String
}
