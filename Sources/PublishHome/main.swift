import Foundation
import Publish
import Plot

struct JhonatnSite: Website {
    typealias SectionID = NoSectionID
    struct ItemMetadata: WebsiteItemMetadata {}
    struct PageMetadata: WebsitePageMetadata {
        let productDownloadLink: URL?
    }

    var url = URL(string: "https://jhona.tn")!
    var name = "Jhonatn"
    var description = "A Software Engineer"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

try JhonatnSite().publish(using: [
    .copyResources(),
    .addMarkdownFiles(),
    .generateHTML(withTheme: Theme(htmlFactory: JhonatnHTMLFactory())),
])
