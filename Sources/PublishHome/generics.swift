import Foundation
import Publish
import Plot

struct NoSectionID: WebsiteSectionID {
    init?(rawValue: String) { nil }
    var rawValue: String { "" }
    static var allCases: [Self] { [] }
}

extension HTMLFactory {
    func makeSectionHTML(
        for section: Section<Site>,
        context: PublishingContext<Site>
    ) throws -> HTML { HTML() }

    func makeItemHTML(
        for item: Item<Site>,
        context: PublishingContext<Site>
    ) throws -> HTML { HTML() }

    func makeTagListHTML(
        for page: TagListPage,
        context: PublishingContext<Site>
    ) throws -> HTML? { nil }

    func makeTagDetailsHTML(
        for page: TagDetailsPage,
        context: PublishingContext<Site>
    ) throws -> HTML? { nil }
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