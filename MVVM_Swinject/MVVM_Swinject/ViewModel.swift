//
//  ViewModel.swift
//  MVVM_Swinject
//
//  Created by Joe on 19/05/19.
//  Copyright © 2019 Joe. All rights reserved.
//

import Foundation
import RxSwift

class ViewModel {
    
    var items : Observable<[Person]>?
    
    func fetchData() {
        let persons = [Person(name: "1"), Person(name: "2")]
        items = Observable.create({ (observer) -> Disposable in
            observer.onNext(persons)
            observer.onCompleted()
            
            return Disposables.create {
                
            }
        })
    }
}
