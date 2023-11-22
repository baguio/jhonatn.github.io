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
