//
//  File.swift
//  
//
//  Created by linhey on 2022/3/6.
//

import Foundation

struct XCImageCodesController {

    struct Output {
        let name: String
        let code: String
        let canOverwritten: Bool
    }
    
    let template: XCImageTemplateDataSource
    
    init(template: XCImageTemplate, sets: [XCImageSet]) {
        self.template = .init(model: template, images: sets)
    }
    
}

extension XCImageCodesController {
    
    func output() -> [Output] {
        return [
            .init(name: template.model.protocolName, code: template.protocol, canOverwritten: true),
            .init(name: template.model.protocolName + "_extension", code: template.extensionProtocol, canOverwritten: false),
            .init(name: template.model.instanceName, code: template.instance, canOverwritten: true),
            .init(name: template.model.instanceName + "_" + template.model.protocolName, code: template.conform, canOverwritten: true)
        ]
    }
    
}
