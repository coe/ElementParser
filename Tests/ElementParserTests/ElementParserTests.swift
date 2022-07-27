import XCTest
@testable import ElementParser

final class ElementParserTests: XCTestCase {
    func testElementParser() throws {
        let parser = XmlElementHandler()
        let rss1 = parser.getElement(from: XMLParser(data: rss1Xml.data(using: .utf8)!))
        XCTAssertEqual(rss1.rss?.channel?.title?.getStringValue(), "Yahoo!ニュース・トピックス - 主要")
        XCTAssertEqual(rss1.rss?.channel?.link?.getStringValue(), "https://news.yahoo.co.jp/topics/top-picks?source=rss")

        XCTAssertEqual(rss1.rss?.channel?.item?[0]?.title?.getStringValue(), "東・西日本、局地的な大雨の恐れ")
        XCTAssertEqual(rss1.rss?.channel?.item?[0]?.pubDate?.getStringValue(), "Tue, 26 Jul 2022 21:40:13 GMT")

        XCTAssertEqual(rss1.rss?.channel?.item?.getArrayValue()?.count,8)
    }
    
    private let rss1Xml: String = """
<rss version="2.0">
<channel>
<language>ja</language>
<copyright>© Yahoo Japan</copyright>
<pubDate>Wed, 27 Jul 2022 00:19:07 GMT</pubDate>
<title>Yahoo!ニュース・トピックス - 主要</title>
<link>https://news.yahoo.co.jp/topics/top-picks?source=rss</link>
<description>Yahoo! JAPANのニュース・トピックスで取り上げている最新の見出しを提供しています。</description>
<item>
<title>東・西日本、局地的な大雨の恐れ</title>
<link>https://news.yahoo.co.jp/pickup/6433776?source=rss</link>
<pubDate>Tue, 26 Jul 2022 21:40:13 GMT</pubDate>
<comments>https://news.yahoo.co.jp/articles/037452c143503a5f50436f25cf89e583a6c80b30/comments</comments>
</item>
<item>
<title>医療・福祉 40年には100万人不足</title>
<link>https://news.yahoo.co.jp/pickup/6433784?source=rss</link>
<pubDate>Tue, 26 Jul 2022 23:21:02 GMT</pubDate>
<comments>https://news.yahoo.co.jp/articles/9abd21b98f078d519460f7e3480b8ae94729000f/comments</comments>
</item>
<item>
<title>学術会議 軍民「両用」の研究容認</title>
<link>https://news.yahoo.co.jp/pickup/6433782?source=rss</link>
<pubDate>Tue, 26 Jul 2022 23:03:57 GMT</pubDate>
<comments>https://news.yahoo.co.jp/articles/5f4671883f9abb10a1c8096d03b038b00d0ca68f/comments</comments>
</item>
<item>
<title>露 欧米が停戦合意「禁止」と主張</title>
<link>https://news.yahoo.co.jp/pickup/6433788?source=rss</link>
<pubDate>Tue, 26 Jul 2022 23:50:59 GMT</pubDate>
<comments>https://news.yahoo.co.jp/articles/acbdc7abb3c17924f8066ee529970916a708dfe2/comments</comments>
</item>
<item>
<title>患者増 FAXに「逆戻り」の保健所</title>
<link>https://news.yahoo.co.jp/pickup/6433783?source=rss</link>
<pubDate>Tue, 26 Jul 2022 22:49:26 GMT</pubDate>
<comments>https://news.yahoo.co.jp/articles/7ce68ff7e2f930aad881fd573ad31b4220bf2fe3/comments</comments>
</item>
<item>
<title>美誠Tリーグ初参戦 日本生命加入</title>
<link>https://news.yahoo.co.jp/pickup/6433786?source=rss</link>
<pubDate>Tue, 26 Jul 2022 23:30:34 GMT</pubDate>
<comments>https://news.yahoo.co.jp/articles/494a5b8f9f4f8f5ef419a33b70e3518e3a341a70/comments</comments>
</item>
<item>
<title>TKO木本 芸人ら個別に事情説明</title>
<link>https://news.yahoo.co.jp/pickup/6433785?source=rss</link>
<pubDate>Tue, 26 Jul 2022 23:12:44 GMT</pubDate>
<comments>https://news.yahoo.co.jp/articles/8ca3b9f2ca418d353b1b02a6d55fc85267d1ddd7/comments</comments>
</item>
<item>
<title>島田陽子さん 遺作が年内公開へ</title>
<link>https://news.yahoo.co.jp/pickup/6433780?source=rss</link>
<pubDate>Tue, 26 Jul 2022 22:40:19 GMT</pubDate>
<comments>https://news.yahoo.co.jp/articles/09c8b3acdaba671c76bc5dcd637eab631f8ee3b4/comments</comments>
</item>
</channel>
</rss>
"""
}
