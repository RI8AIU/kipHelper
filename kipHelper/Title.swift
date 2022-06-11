//
//  Title.swift
//  kipHelper
//
//  Created by Андрей Поморцев on 10.06.2022.
//

import Foundation

struct Title {
    
    let  value: String?
    
    static func getTitle() -> [Title] {
        [
            Title(value: "Конвертер единиц концентрации газов"),
            Title(value: "Масштабирование шкалы"),
            Title(value: "Маркировка резисторов")
            
        ]
    }

}
