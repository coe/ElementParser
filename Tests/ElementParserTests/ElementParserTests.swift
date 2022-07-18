import XCTest
@testable import ElementParser

final class ElementParserTests: XCTestCase {
    func testElementParser() throws {
        let parser = ElementParser()
        let rss1 = parser.getElement(from: XMLParser(data: rss1Xml.data(using: .utf8)!))
        XCTAssertEqual(rss1.RDF?.channel?.title?.getStringValue(), "gihyo.jp：Software Design")
        XCTAssertEqual(rss1.RDF?.channel?.link?.getStringValue(), "https://gihyo.jp/magazine/SD")

        XCTAssertEqual(rss1.RDF?.item?[1]?.title?.getStringValue(), "日立システムアンドサービス，UTMアプライアンス「SSG 320M/350M」発売")
        XCTAssertEqual(rss1.RDF?.item?[1]?.date?.getStringValue(), "2007-12-06T09:50:43+09:00")

        XCTAssertEqual(rss1.RDF?.item?.getArrayValue()?.count,20)
    }
    
    private let rss1Xml: String = """
<rdf:RDF xmlns="http://purl.org/rss/1.0/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:mn="http://usefulinc.com/rss/manifest/" xml:lang="ja">
<channel>
<title>gihyo.jp：Software Design</title>
<link>https://gihyo.jp/magazine/SD</link>
<description>gihyo.jp（Software Design）の更新情報をお届けします</description>
<dc:language>ja-jp</dc:language>
<dc:publisher>技術評論社</dc:publisher>
<dc:rights>技術評論社 2022</dc:rights>
<image rdf:resource="https://gihyo.jp/assets/templates/gihyojp2007/image/header_logo_gihyo.gif"/>
<items>
<rdf:Seq>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0026"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0025"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0024"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0023"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0022"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0021"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0020"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0019"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0018"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0017"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0016"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0015"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0014"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0013"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0012"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0011"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0010"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0009"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0007"/>
<rdf:li rdf:resource="https://gihyo.jp/magazine/SD/newshotline/200712/0008"/>
</rdf:Seq>
</items>
</channel>
<image rdf:about="https://gihyo.jp/assets/templates/gihyojp2007/image/header_logo_gihyo.gif">
<title>gihyo.jp</title>
<link>https://gihyo.jp/</link>
<url>https://gihyo.jp/assets/templates/gihyojp2007/image/header_logo_gihyo.gif</url>
</image>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0026">
<title>IDGジャパン，SaaS専門のカンファレンス「SaaS World 2007」開催</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0026</link>
<description>株式会社IDGジャパンは11月28，29日にかけて，SaaS専門のカンファレンス「SaaS World 2007」を都内にて開催する。</description>
<dc:date>2007-12-06T09:51:09+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0025">
<title>日立システムアンドサービス，UTMアプライアンス「SSG 320M/350M」発売</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0025</link>
<description>株式会社日立システムアンドサービスは11月1日，UTMアプライアンス「Juniper Networks SSG」シリーズの新製品「SSG 320M/350M」を発売した。</description>
<dc:date>2007-12-06T09:50:43+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0024">
<title>テックリンク／トランスウエア，spamメール対策アプライアンス「JUNIOR10」発売</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0024</link>
<description>有限会社テックリンクは11月1日，株式会社トランスウエアが開発したspamメール対策製品「Active! hunter」と自社技術を統合させたspamメール対策アプライアンス「JUNIOR10」を発売した。</description>
<dc:date>2007-12-05T09:51:27+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0023">
<title>ぷらっとホーム，USB接続のKVM切り替え機器「PShare RU」発売</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0023</link>
<description>ぷらっとホーム株式会社は10月24日，Avocent, Inc.と共同開発したUSB接続の1UサイズKVM切り替え機器「PShare RU」を発売した。</description>
<dc:date>2007-12-05T09:50:31+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0022">
<title>ターボリナックス／米Microsoft，LinuxとWindowsサーバ間の相互運用において協業契約を締結</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0022</link>
<description>ターボリナックス株式会社と米Microsoftは10月23日，LinuxとWindowsサーバ間の相互運用性の向上などに関する協業契約を米国時間10月22日に締結したと発表した。</description>
<dc:date>2007-12-04T09:51:30+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0021">
<title>サイボウズ，営業支援システム製品「サイボウズ ドットセールス」試用ダウンロード版提供開始</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0021</link>
<description>サイボウズ株式会社は10月22日，営業支援システム製品「サイボウズ ドットセールス」の機能を強化し，試用ダウンロード版の提供を開始した。</description>
<dc:date>2007-12-04T09:50:21+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0020">
<title>シックス・アパート，企業向けblogソフトウェア「Movable Type Enterprise 4」リリース</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0020</link>
<description>シックス・アパート株式会社は10月17日，企業向けblogソフトウェア「Movable Type Enterprise 4」をリリースした。</description>
<dc:date>2007-12-03T09:51:14+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0019">
<title>サン・マイクロシステムズ，ラックマウント型サーバ「Sun Fire X4150サーバ」など発売</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0019</link>
<description>サン・マイクロシステムズ株式会社は10月17日，ラックマウント型サーバ「Sun Fire X4150サーバ」（以下，X4150）および「Sun Fire X4450サーバ」（以下，X4450）を発売した。</description>
<dc:date>2007-12-03T09:50:47+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0018">
<title>エクセルソフト，XML文書を最適に変換する「インテル XSLT アクセラレーター 1.1」発売</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0018</link>
<description>エクセルソフト株式会社は10月17日，XML文書を最適変換するXSLTアクセラレータ「インテル XSLT アクセラレーター 1.1」を発売した。</description>
<dc:date>2007-11-30T09:51:26+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0017">
<title>トランスウエア，「SASTIK III Server」を組み合わせたWebメールソリューション</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0017</link>
<description>株式会社トランスウエアと株式会社サスライトは10月16日，業務提携に合意し，（株）トランスウエアが提供するWebメールソフトウェア「Active! mail」と（株）サスライトが提供するアクセス権統合パッケージ「SASTIK III Server」を組み合わせたWebメールソリューションを11月11日より発売した。</description>
<dc:date>2007-11-30T09:50:58+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0016">
<title>SWsoft，Windows Server 2008に対応したコントロールパネル「Plesk 8.3 for Windows」ベータ版発表</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0016</link>
<description>SWsoft, Inc.は10月15日，Windows Server 2008およびInternet Information Services 7.0に対応したサーバコントロールパネル「Plesk 8.3 for Windows」を発表した。</description>
<dc:date>2007-11-29T09:51:30+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0015">
<title>アドベントネット，企業向けIT総合監視ソフトウェア「AdventNet ManageEngine OpManager」無料版提供開始</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0015</link>
<description>アドベントネット株式会社は10月15日，企業向け総合監視ソフトウェア「AdventNet ManageEngine OpManager」無料版の提供を開始した。</description>
<dc:date>2007-11-29T09:50:56+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0014">
<title>ソフトイーサ，VPNソフトウェア「PacketiX VPN 2.0」英語版発売</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0014</link>
<description>ソフトイーサ株式会社は10月12日，VPNソフトウェア「PacketiX VPN 2.0」の英語版を発売した。</description>
<dc:date>2007-11-28T09:51:30+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0013">
<title>日本ヒューレット・パッカード，パーソナルワークステーション「HP xw4550/CT Workstation」など発売</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0013</link>
<description>日本ヒューレット・パッカード株式会社は10月11日，「HP xw4550/CT Workstation」および「HP xw4600/CT Workstation」（以下，xw4550／xw4600）を発売した。</description>
<dc:date>2007-11-28T09:50:09+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0012">
<title>インテル,「次世代インテル vPro テクノロジー・コンファレンス 2007」にて次世代vProの技術を紹介</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0012</link>
<description>インテル株式会社は10月11日，都内で開催された「次世代インテル vPro テクノロジー・コンファレンス 2007」において，次世代の「インテル vPro プロセッサー・テクノロジー」搭載プラットフォームに含まれる技術を紹介した。</description>
<dc:date>2007-11-27T09:51:30+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0011">
<title>3Di，OSSベースの3D仮想空間プラットフォーム「Jin-sei」発表</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0011</link>
<description>3Di株式会社は10月11日，OSSベースの3D仮想空間プラットフォーム「Jin-sei」を発表した。</description>
<dc:date>2007-11-27T09:50:18+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0010">
<title>オレンジソフト，暗号化アプライアンスサーバに仮想アプライアンス「BRSA-02V」を追加</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0010</link>
<description>株式会社オレンジソフトは10月10日，メールの添付ファイルを暗号化ZIPファイルに自動変換させるアプライアンスサーバ「BRODIAEA safeAttach」に，VMware上の仮想マシンで稼働する仮想アプライアンス「BRSA-02V」を搭載させたモデルを発表した。</description>
<dc:date>2007-11-23T10:59:02+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0009">
<title>ワダックス，共用型レンタルサーバ「@NEXT STYLE」機能拡張</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0009</link>
<description>株式会社ワダックスは10月10日，同社が提供する共用型レンタルサーバ「＠Next Style 共用サーバー」の全サービスにおいて，容量を最大10倍に拡張した。</description>
<dc:date>2007-11-23T10:59:01+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0007">
<title>タイムインターメディア，日本語全文検索ソフトウェア「Kabayaki Basic Linux / Windows 2.1.0」発売</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0007</link>
<description>株式会社タイムインターメディアは10月10日，日本語全文検索アプライアンス「Kabayaki Basic Linux / Windows 2.1.0」を発売した。</description>
<dc:date>2007-11-22T10:10:08+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
<item rdf:about="https://gihyo.jp/magazine/SD/newshotline/200712/0008">
<title>マカフィー，Linux向けセキュリティソリューション「McAfee Linux Shield 1.5」発売</title>
<link>https://gihyo.jp/magazine/SD/newshotline/200712/0008</link>
<description>マカフィー株式会社は10月10日，Linux向けのセキュリティソリューション「McAfee Linux Shield 1.5」を発売した。</description>
<dc:date>2007-11-22T09:52:32+09:00</dc:date>
<dc:subject>News Hot Line</dc:subject>
<dc:creator>技術評論社</dc:creator>
</item>
</rdf:RDF>
"""
}
