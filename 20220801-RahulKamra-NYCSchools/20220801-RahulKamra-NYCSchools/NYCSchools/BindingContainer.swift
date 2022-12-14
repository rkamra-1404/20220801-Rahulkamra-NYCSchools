//
//  BindingContainer.swift
//  20220801-RahulKamra-NYCSchools
//
//  Created by Rahul Kamra on 01/08/22.
//

import Foundation

class Container<Element> {
    typealias CompletionHandler = (Element?) -> ()
    var value : Element? {
        didSet {
            guard let value = self.value else {return}
            handler?(value)
        }
    }
    
    var handler : CompletionHandler?
    
    init(value : Element?,handler : CompletionHandler? = nil) {
        self.value = value
        self.handler = handler
    }
    func bind(withHandler handler : @escaping CompletionHandler){
        self.handler = handler
        self.handler!(value)
    }
}
