import Foundation
import Publish
import Plot

struct JhonatnSite: Website {
    typealias SectionID = NoSectionID
    struct ItemMetadata: WebsiteItemMetadata {}

    var url = URL(string: "https://jhona.tn")!
    var name = "Jhonatn"
    var description = "A Software Engineer"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

extension Theme {
    static var jhonatnLanding: Self {
        Theme(htmlFactory: JhonatnHTMLFactory())
    }

    private struct JhonatnHTMLFactory: HTMLFactory {
        func makeIndexHTML(
            for index: Index,
            context: PublishingContext<Site>
        ) throws -> HTML {
            HTML(head: [
                .viewport(.accordingToDevice, fit: .cover),
                .style("""
                    body { margin:0px;overflow:hidden;font-family:-apple-system,BlinkMacSystemFont,sans-serif,system-ui; }
                    a { color:rgb(0,122,255); }
                    ion-icon { font-size: 24pt;margin:4pt 0; }
                    """
                ),
                .script(
                    .attribute(named: "type", value: "module"),
                    .src("https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js")
                ),
                .script(
                    .attribute(named: "nomodule"),
                    .src("https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js")
                ),
            ]) {
                Div {
                    Div {
                        Div {
                            Span {
                                Text("Jhonatan Avalos")
                                    .addLineBreak()
                            }.style("font-size:3em;font-weight:600;color:rgb(29,29,31);")
                            Span {
                                Text("Software developer. Mainly mobile stuff")
                            }.style("font-size:1em;font-weight:400;color:rgb(134,134,139);")
                        }
                        .style("width:80%;float:left;position:absolute;top:25%;transform:translateY(-50%);")
                    }
                    .style("height:50dvh;margin:0 32pt;")
                    Div {
                        Div {
                            Link(url: "https://www.linkedin.com/in/jhonatanavalosg/") {
                                IonIcon("logo-linkedin")
                            }
                            Link(url: "https://github.com/jhonatn/") {
                                IonIcon("logo-github")
                            }
                            Link(url: "https://github.com/jhonatn/jhonatn.github.io/") {
                                IonIcon("code-slash")
                            }
                        }
                        .style("flex:25%;float:left;margin:32pt;display: grid;align-content:end;")
                        Div ()
                        .style("flex:75%;float:right;background:url(/iphonecam.jpg) bottom right no-repeat;background-size:contain;")
                    }
                    .style("height:50dvh;display:flex;")
                }
                .style("width:100%;")
            }
        }

        func makePageHTML(
            for page: Page,
            context: PublishingContext<Site>
        ) throws -> HTML {
            HTML(head: [
                .meta(.charset(.utf8)),
                .viewport(.accordingToDevice, initialScale: 1),
                .style("""
                    body {
                        margin: 0;
                        padding: 0;
                        overflow-x: hidden;
                    }
                    
                    .container {
                        display: flex;
                        flex-direction: column;
                    }
                    
                    .left, .right {
                        flex: 1;
                        box-sizing: border-box;
                        padding: 24pt;
                    }
                    
                    .left {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        background-color: #f0f0f0;
                    }
                    
                    .left img {
                        max-width: 100%;
                        height: auto;
                    }
                    
                    .right {
                        display: flex;
                        flex-direction: column;
                        justify-content: center;
                    }
                    
                    .content * {
                        margin: 24pt 0;
                    }
                    
                    .content h1 {
                        font-size: 2em;
                    }
                    
                    @media screen and (orientation: landscape) {
                        .container {
                            flex-direction: row;
                        }
                        .left {
                            flex: 1;
                            min-height: 100vh;
                        }
                        .right {
                            flex: 1;
                            min-height: 100vh;
                        }
                    }
                """)
            ]) {
                Div {
                    Div {
                        if let imagePath = page.imagePath {
                            Image(imagePath.string)
                        }
                    }.class("left")
                    Div {
                        Div(page.content.body)
                            .class("content")
                    }.class("right")
                }.class("container")
            }
        }
    }
}

try JhonatnSite().publish(using: [
    .copyResources(),
    .addMarkdownFiles(),
    .generateHTML(withTheme: .jhonatnLanding),
])
