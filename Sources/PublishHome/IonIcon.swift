//
//  File.swift
//  
//
//  Created by Jhonatan A. on 21/11/23.
//

import Publish
import Plot

extension Node where Context: HTMLScriptableContext {
    static var ionIconModule: Node {
        .script(
            .attribute(named: "type", value: "module"),
            .src("https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js")
        )
    }
    static var ionIconNoModule: Node {
        .script(
            .attribute(named: "nomodule"),
            .src("https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js")
        )
    }
}

struct IonIcon: Component {
    let name: String

    init(_ name: String) {
        self.name = name
    }

    public var body: Component {
        Node<HTML.BodyContext>.element(
            named: "ion-icon",
            nodes: [
                .attribute(named: "name", value: name)
            ]
        )
    }
}
