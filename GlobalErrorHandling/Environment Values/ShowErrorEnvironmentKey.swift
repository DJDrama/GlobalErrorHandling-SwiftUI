//
//  ShowErrorEnvironmentKey.swift
//  GlobalErrorHandling
//
//  Created by Dongjun Lee on 11/7/24.
//

import Foundation
import SwiftUI

// showError(Error, String)

struct ShowErrorAction {
    typealias Action = (Error, String) -> Void
    let action: Action
    
    func callAsFunction(_ error: Error, _ guidance: String) {
        action(error, guidance)
    }
}

struct ShowErrorEnvironmentKey: EnvironmentKey {
    static var defaultValue: ShowErrorAction = ShowErrorAction {_, _ in }
}

extension EnvironmentValues {
    // @Environment(\.dismiss)
    // @Environment(\.locale) ...
    var showError: (ShowErrorAction) {
        get { self[ShowErrorEnvironmentKey.self] }
        set { self[ShowErrorEnvironmentKey.self] = newValue}
    }
}
