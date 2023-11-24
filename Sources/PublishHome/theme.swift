//
//  File.swift
//  
//
//  Created by Jhonatan A. on 21/11/23.
//

import Publish
import Plot

struct JhonatnHTMLFactory<Site: Website>: HTMLFactory {
    private let fontFamily = "-apple-system,BlinkMacSystemFont,sans-serif,system-ui"
    
    func makeIndexHTML(
        for index: Index,
        context: PublishingContext<Site>
    ) throws -> HTML {
        HTML(head: [
            .viewport(.accordingToDevice, fit: .cover),
            .style("""
                body { margin:0px; overflow:hidden; font-family:\(fontFamily); }
                a { color:rgb(0,122,255); }
                ion-icon { font-size:24pt; margin:4pt 0; }
                """
            ),
            .ionIconModule,
            .ionIconNoModule,
        ]) {
            Div {
                Div {
                    Div {
                        Span {
                            Text("Jhonatan Avalos")
                                .addLineBreak()
                        }.style("font-size:3em; font-weight:600; color:rgb(29,29,31);")
                        Span {
                            Text("Software developer. Mainly mobile stuff")
                        }.style("font-size:1em; font-weight:400; color:rgb(134,134,139);")
                    }
                    .style("width:80%; float:left; position:absolute; top:25%; transform:translateY(-50%);")
                }
                .style("height:50dvh; margin:0 32pt;")
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
                    .style("flex:25%; float:left; margin:32pt; display: grid; align-content:end;")
                    Div ()
                    .style("flex:75%; float:right; background:url(/iphonecam.jpg) bottom right no-repeat; background-size:contain;")
                }
                .style("height:50dvh; display:flex;")
            }
            .style("width:100%;")
        }
    }

    func makePageHTML(
        for page: Page<Site>,
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
                    font-family: \(fontFamily);
                }
                
                h1 {
                    font-size: 2em;
                }
                
                p {
                    text-align: justify;
                }
                
                .container {
                    display: flex;
                    flex-direction: column;
                }
                
                .left, .right {
                    flex: 1;
                    box-sizing: border-box;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }
                
                .left {
                    background-color: #f0f0f0;
                }
                
                .right {
                    flex-direction: column;
                }
                
                header, footer {
                    margin-top: auto;
                }
                
                .content {
                    max-width: 300pt;
                    height: auto;
                    margin: 24pt;
                }
                
                .content * {
                    margin: 24pt 0;
                    width: 100%;
                }
                
                footer * {
                    margin: auto 8pt;
                }
                
                a {
                    vertical-align: middle;
                }
                
                footer {
                    font-size: 24pt;
                    margin-bottom: 16pt;
                }
                
                @media screen and (orientation: landscape) {
                    .container {
                        flex-direction: row;
                    }
                    .left, .right {
                        flex: 1;
                        min-height: 100vh;
                    }
                }
            """),
            .ionIconModule,
            .ionIconNoModule,
        ]) {
            Div {
                Div {
                    Div {
                        if let imagePath = page.imagePath {
                            Image(imagePath.string)
                        }
                    }.class("content")
                }.class("left")
                Div {
                    Header()
                    Div(page.content.body)
                        .class("content")
                    Footer {
                        Link(url: "") {
                            Image("/cta_macappstore.svg")
                        }
                        Link(url: "https://mastodon.social/@jhonatn/") {
                            IonIcon("logo-mastodon")
                        }
                    }
                }.class("right")
            }.class("container")
        }
    }
}
