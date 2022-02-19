//
//  File.swift
//  
//
//  Created by linhey on 2022/2/9.
//

import Foundation

struct XCColorCodesController {

    struct Output {
        let name: String
        let code: String
    }
    
    let template: XCColorTemplateDataSource
    
    init(template: XCColorTemplate, sets: [XCColorSet]) {
        self.template = .init(model: template, colors: sets)
    }
    
}

extension XCColorCodesController {
    
    func output() -> [Output] {
        return [
            .init(name: template.model.protocolName, code: template.protocol),
            .init(name: template.model.protocolName + "_extension", code: template.extensionProtocol),
            .init(name: template.model.instanceName, code: template.instance),
            .init(name: template.model.instanceName + "_" + template.model.protocolName, code: template.conform)
        ]
    }
    
}
