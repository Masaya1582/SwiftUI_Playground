// 
//  DefaultViewModel.swift
//  SwiftUI_Playground
//
//  Created by MasayaNakakuki on 2023/06/26.
//

// import RxSwift
// import RxCocoa

protocol DefaultViewModelInputs: AnyObject {

}

protocol DefaultViewModelOutputs: AnyObject {

}

protocol DefaultViewModelType: AnyObject {
    var inputs: DefaultViewModelInputs { get }
    var outputs: DefaultViewModelOutputs { get }
}

class DefaultViewModel: DefaultViewModelType, DefaultViewModelInputs, DefaultViewModelOutputs {

    var inputs: DefaultViewModelInputs { return self }
    var outputs: DefaultViewModelOutputs { return self }

    // private let disposeBag = DisposeBag()

    init() {
        
    }

}
