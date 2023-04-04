//  
//  SettingsSceneDIContainer.swift
//  CleanArchitectureMVVMAsyncAwait
//
//  Created by TAE SU LEE on 2023/03/20.
//

import DomainLayer
import DataLayer
import UIKit

public final class SettingsSceneDIContainer {
    
    struct Dependencies {
        let networking: SettingsNetworking
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    // MARK: - UseCases
    public func makeUseCase() -> SettingsUseCaseProtocol {
        return SettingsUseCase(repository: makeRepository())
    }
    
    // MARK: - Repositories
    private func makeRepository() -> SettingsRepository {
        return SettingsRepositoryImp(network: dependencies.networking)
    }
}
