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
    
    func testElement2Parser() throws {
        let parser = XmlElementHandler()
        let rss1 = parser.getElement(from: XMLParser(data: rss2Xml.data(using: .utf8)!))
        XCTAssertNotNil(rss1.rss)
        XCTAssertEqual(rss1.rss?.channel?.title?.getStringValue(), "coffeegyunyu")
        XCTAssertEqual(rss1.rss?.channel?.accentColor?.getStringValue(), "249F80")
        XCTAssertEqual(rss1.rss?.channel?.item?.getArrayValue()?.count, 5)

        XCTAssertEqual(rss1.rss?.channel?.item?.title?.getStringValue(), rss1.rss?.channel?.item?[0]?.title?.getStringValue())
        XCTAssertEqual(rss1.rss?.channel?.item?[1]?.title?.getStringValue(), "プログラミングで年収1000万を目指すために確認すべき、たった一つのこととは？")
        
        // trim CDATA
        XCTAssertEqual(rss1.rss?.channel?.item?[4]?.description?.getStringValue()?.trimmingCharacters(in: .whitespacesAndNewlines), """
    <p name="MCVCB">必要に迫られたのでnoteを開設しました。</p><p name="fbFZ4">ということでiOSDC 2021にスピーカーとして参加してました。自分のセッションに関しては別なところで書こうと思います。好きなパンは東京都板橋区にあるブランジェリーケンのみそナッツクリームチーズベーグルです。資料の中にハッシュタグありますけどこれはiOSDCチャレンジトークンではありません。</p><br/><a href='https://note.com/coffeegyunyu/n/n4a4f393cbd37'>続きをみる</a>
    """)

        XCTAssertEqual(rss1.rss?.getAttributeValue(key: "version"), "2.0")
        XCTAssertEqual(rss1.rss?.channel?.related?.getAttributeValue(key: "layout"), "card")


    }
    
    private let rss2Xml: String = """
<rss xmlns:atom="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/"
    xmlns:note="https://note.com" xmlns:webfeeds="http://webfeeds.org/rss/1.0"
    version="2.0">
    <channel>
        <title>coffeegyunyu</title>
        <description>北海道から来ました</description>
        <link>https://note.com/coffeegyunyu</link>
        <atom:link href="https://note.com/coffeegyunyu/rss/" rel="self"
            type="application/rss+xml" />
        <copyright>coffeegyunyu</copyright>
        <webfeeds:icon>
            https://d2l930y2yx77uc.cloudfront.net/assets/default/default_note_logo-100a27d592505c50c29b032c0554570c955f312b8937727c8777fd87b3068c71.png
        </webfeeds:icon>
        <webfeeds:logo>
            https://d2l930y2yx77uc.cloudfront.net/assets/default/default_note_logo-100a27d592505c50c29b032c0554570c955f312b8937727c8777fd87b3068c71.png
        </webfeeds:logo>
        <webfeeds:accentColor>249F80</webfeeds:accentColor>
        <webfeeds:related layout="card" target="browser" />
        <webfeeds:analytics engine="GoogleAnalytics" id="UA-48687000-1" />
        <language>ja</language>
        <lastBuildDate>Wed, 27 Jul 2022 10:48:26 +0900</lastBuildDate>
        <item>
            <title>誰にでも鉱脈は存在する　蘇る「錬金術師」という存在</title>
            <media:thumbnail>
                https://assets.st-note.com/production/uploads/images/66184036/rectangle_large_type_2_165ed5fef82fbac4154ccff093da34ab.png?width=800
            </media:thumbnail>
            <description>
                <![CDATA[
<p name="FAqi4">みなさんは錬金術師という存在を知っているだろうか<br>言葉にするべくもなく、金というものには価値がある。<br>その希少性や価値はもとより、何よりもその美しさに魅せられ、人々は古代から金を求めてきた。<br>あるものは装飾品して、またあるものは資産として。<br>人類の軌跡は金と共に歩んできたと言ってもいいだろう。<br>いや、金本位制という言葉が示すように人は金の呪縛から逃れることは出来なかった、というのが正しいのかもしれない。<br>そんな金の魔力に取り憑かれた人類は、いつしかその魔力を自在にするために研究を重ね始める。<br>それが錬金術である。<br>沢山の人間が卑金属から賢者の石を精製せんと意気込んだ。その研究成果は物理学の礎としてさまざまな分野で利用されるようになった。しかし、金自体を作り出す事はついには出来なかった。<br>これが錬金術の事の顛末である。<br>無から万物を作る。そんなことは出来るわけがない。<br>多くの方々はそう思う事でしょう。<br>しかし、金を作ることは無理でも、その「無」から鉱物を作り上げる。<br>こんなことが出来るのは、錬金術師と名乗ってもいいのではないでしょうか。<br><br>なぜこんな話をしたのかというと、魔女裁判を恐れず言うと僕が錬金術師だからです。<br>偶然というのはあるかもしれない。誰もが信じてくれないでしょう。<br>しかし僕は過去に二回も物質の精製に成功しています。<br>そして、今日もまた。<br>体が疼く。<br>指先がチリチリする。<br>口の中はカラカラだ。<br>静まれ！体の中の疼痛…！<br><br>というわけで病院に行ってきたんですけど、見事に尿管結石の診断を賜りまして今に至ります。<br>まるでアコヤガイがその身に真珠を宿すように、僕の体の中で日頃の成果が結実した瞬間です。<br>「私は貝になりたい」という映画がありますが、人は貝になれます。<br>かれこれ10年ぶり3回目の精製になります。倉敷商みたいですね。<br>尿管結石というのは痛みの王様とも言われていて、最近病気とは無縁だった僕も無事王政復古。<br>賢者の石が僕の下腹部に圧政を敷いていきます。<br>結石には純粋な水分の摂取が一番と言われています。体の循環を良くしてドクターストーンを出そうという魂胆です。今までソフトカツゲンしか飲んで無かった僕も急いで水に切り替えていきます。口の中もカラカラだしね。<br><br>しかしながら、この「ひたすら水を飲む」というウォーターボーディングにも似た拷問が厳しいです。人魚の涙が宝石になる、という御伽噺があります。その人魚は宝石目当てで苛烈な拷問を受けてしまうのですが人魚と現在の僕は重なるところがあります。シーマンです。人魚が待ち望まれているのは落涙ですが、僕は落石です。<br><br>ひとしきり医者と歓談のあと、飲み薬と坐薬をもらいました。<br>飲み薬は治療のための薬で、坐薬は痛み止めです。<br>飲み薬は「ウロカルン」という名前で、パッケージのデザインから「絶対に先っちょから石出してやるぜ」の意気込みが感じられる、中日の岩瀬のような頼もしさを醸し出してくれます。</p><p name="2u31b"><img src="https://assets.st-note.com/production/uploads/images/66183619/picture_pc_de3bd689c6332a5cf7987af2972c13aa.jpg" width="620" height="826" id="image-2u31b"></p><br/><a href='https://note.com/coffeegyunyu/n/n030d5582d8c5'>続きをみる</a>
]]>
            </description>
            <note:creatorImage>
                https://assets.st-note.com/production/uploads/images/61761275/profile_c81cf4cf115912347a6df77c65b8255e.png?fit=bounds
                &amp;format=jpeg&amp;quality=85&amp;width=330
            </note:creatorImage>
            <note:creatorName>coffeegyunyu</note:creatorName>
            <pubDate>Mon, 22 Nov 2021 12:07:41 +0900</pubDate>
            <link>https://note.com/coffeegyunyu/n/n030d5582d8c5</link>
            <guid>https://note.com/coffeegyunyu/n/n030d5582d8c5</guid>
        </item>
        <item>
            <title>プログラミングで年収1000万を目指すために確認すべき、たった一つのこととは？</title>
            <media:thumbnail>
                https://assets.st-note.com/production/uploads/images/62223594/rectangle_large_type_2_6a23df730ddb6e71ad5b8cfee60b684f.jpeg?width=800
            </media:thumbnail>
            <description>
                <![CDATA[
<p name="3lRj4">みなさんはよくネット上などで、「プログラミングを習得して年収1000万」などという記事を見かけたことはないでしょうか？おそらくほとんどの人は眉に唾をつけて聞いているに違いないでしょう。しかしながら考えてほしい。両手の指に唾をつけて、頭にぐりぐり擦りながら考えてほしい。とんち.  年収1000万をもらえるということは、その仕事にそれだけの価値があるという逆説になります。価値があればそれだけの対価が生まれるわけです。顧客が求めたものが正しく提供されれば、相応の価値が生まれるわけです。考えても見てください。あなたは3DOのゲームがやりたくて3DO REALを購入したとします。それなのに3DO TRYが届いたらどう思いますか？どうとも思いませんよね？</p><p name="ommZB">というわけで、この記事にお目通しされたのも何かの縁。 #出会いに感謝 。 #プログラミング で #年収1000万 を目指す方法についてお伝えしたいと思います。しかもただお伝えするだけでなく、「自分は1000万欲しいけど、他人が儲かるのは絶対に許せない」という御仁のため、一切の有料記事や広告なしにお伝えしたいと思います。 #プログラミングスクール、 #クラウドファンディング 、amaoznなどにも誘導しません。一切の見返りもいただかない、そんな記事に仕上がっております。役に立ったらスキボタンを押してください。</p><br/><a href='https://note.com/coffeegyunyu/n/n7a9edf8afa66'>続きをみる</a>
]]>
            </description>
            <note:creatorImage>
                https://assets.st-note.com/production/uploads/images/61761275/profile_c81cf4cf115912347a6df77c65b8255e.png?fit=bounds
                &amp;format=jpeg&amp;quality=85&amp;width=330
            </note:creatorImage>
            <note:creatorName>coffeegyunyu</note:creatorName>
            <pubDate>Tue, 28 Sep 2021 09:14:56 +0900</pubDate>
            <link>https://note.com/coffeegyunyu/n/n7a9edf8afa66</link>
            <guid>https://note.com/coffeegyunyu/n/n7a9edf8afa66</guid>
        </item>
        <item>
            <title>今話題の最新スイーツ「マリトッツォ」徹底解剖！</title>
            <media:thumbnail>
                https://assets.st-note.com/production/uploads/images/62178833/rectangle_large_type_2_6e14f7a774c10b0d5a9e22f1e37a8ffb.jpeg?width=800
            </media:thumbnail>
            <description>
                <![CDATA[
<p name="XFBxf">皆さんはマリトッツォというスイーツをご存知でしょうか？最近はテレビや雑誌やmixiコミュニティでも話題になっているのでご存知の方も多いかと思います。しかし僕はその話題に登るずっと前からマリトッツォ知ってるんですよ僕は。そんなマリトッツォをみてきた僕、略してマリみてがこっそり教えるマリトッツォの秘密を教えて行こうと思い、教える用のnoteを書いて教えます。</p><p name="Dfsun">まず、テレビや雑誌や755でも話題沸騰のマリトッツォの基本情報についてですが、マリトッツォというのはスイーツに分類されます。そのマリトッツォのスイーツとしての実力たるや、スカルミリョーネ、バルバリシア、ルビカンテ、マリトッツォとして四天王として並び称されるまでの勢力となっています。そんなマリトっツォなんですが、もう自分のMacの変換が頑なに「マリトっツォ」って感じに変換するので以下めんどくさいので以下時々マリトっツォになるんですが、簡単に概要を説明するとクリームパンです。しかしこのマリトっツォは単なるクリームパンとは明確に違うところがあります。おいしいんです。</p><br/><a href='https://note.com/coffeegyunyu/n/n04a0d040fbe1'>続きをみる</a>
]]>
            </description>
            <note:creatorImage>
                https://assets.st-note.com/production/uploads/images/61761275/profile_c81cf4cf115912347a6df77c65b8255e.png?fit=bounds
                &amp;format=jpeg&amp;quality=85&amp;width=330
            </note:creatorImage>
            <note:creatorName>coffeegyunyu</note:creatorName>
            <pubDate>Mon, 27 Sep 2021 14:39:05 +0900</pubDate>
            <link>https://note.com/coffeegyunyu/n/n04a0d040fbe1</link>
            <guid>https://note.com/coffeegyunyu/n/n04a0d040fbe1</guid>
        </item>
        <item>
            <title>せっかくnote開設したんだしなんか書いてみようと思います</title>
            <media:thumbnail>
                https://assets.st-note.com/production/uploads/images/61794966/rectangle_large_type_2_e6a8c677d4dc5b3eb6e4347cb208d764.png?width=800
            </media:thumbnail>
            <description>
                <![CDATA[
<p name="HkcUJ">それはある一つの電話から始まった。</p><p name="ePGCO">きっかけはこちらからだっただろうか。いや、向こうからだったかな？そんなことさえ思い出せないくらい電話に夢中になっていた。こちらの思い、将来のこと、そしてあなたのこと。時はあっという間に過ぎていく。まだまだ聞きたいことだらけなのに。ああ、神様、せめて、せめて今日だけでもうるう秒をください。</p><br/><a href='https://note.com/coffeegyunyu/n/n7e82187afa0a'>続きをみる</a>
]]>
            </description>
            <note:creatorImage>
                https://assets.st-note.com/production/uploads/images/61761275/profile_c81cf4cf115912347a6df77c65b8255e.png?fit=bounds
                &amp;format=jpeg&amp;quality=85&amp;width=330
            </note:creatorImage>
            <note:creatorName>coffeegyunyu</note:creatorName>
            <pubDate>Wed, 22 Sep 2021 08:12:14 +0900</pubDate>
            <link>https://note.com/coffeegyunyu/n/n7e82187afa0a</link>
            <guid>https://note.com/coffeegyunyu/n/n7e82187afa0a</guid>
        </item>
        <item>
            <title>iOSDC 2021感想</title>
            <media:thumbnail>
                https://assets.st-note.com/production/uploads/images/61627619/rectangle_large_type_2_6636f61f33e9de8f17f3db6b2a57179b.png?width=800
            </media:thumbnail>
            <description>
                <![CDATA[
<p name="MCVCB">必要に迫られたのでnoteを開設しました。</p><p name="fbFZ4">ということでiOSDC 2021にスピーカーとして参加してました。自分のセッションに関しては別なところで書こうと思います。好きなパンは東京都板橋区にあるブランジェリーケンのみそナッツクリームチーズベーグルです。資料の中にハッシュタグありますけどこれはiOSDCチャレンジトークンではありません。</p><br/><a href='https://note.com/coffeegyunyu/n/n4a4f393cbd37'>続きをみる</a>
]]>
            </description>
            <note:creatorImage>
                https://assets.st-note.com/production/uploads/images/61761275/profile_c81cf4cf115912347a6df77c65b8255e.png?fit=bounds
                &amp;format=jpeg&amp;quality=85&amp;width=330
            </note:creatorImage>
            <note:creatorName>coffeegyunyu</note:creatorName>
            <pubDate>Mon, 20 Sep 2021 11:39:11 +0900</pubDate>
            <link>https://note.com/coffeegyunyu/n/n4a4f393cbd37</link>
            <guid>https://note.com/coffeegyunyu/n/n4a4f393cbd37</guid>
        </item>
    </channel>
</rss>
"""
    
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
