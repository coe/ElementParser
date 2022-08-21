import XCTest
@testable import ElementParser

final class ElementParserTests: XCTestCase {
    func testElement2Parser() throws {
        let parser = ElementParser()
        let rss1 = parser.getDocument(from: XMLParser(data: noteXml.data(using: .utf8)!))
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
    
    private let noteXml: String = """
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
    private let atomXml: String = """
<feed xmlns="http://www.w3.org/2005/Atom">
<title>gihyo.jp：WEB+DB PRESS</title>
<subtitle>gihyo.jp（WEB+DB PRESS）の更新情報をお届けします</subtitle>
<id>https://gihyo.jp/magazine/wdpress</id>
<link href="https://gihyo.jp/magazine/wdpress"/>
<author>
<name>技術評論社</name>
</author>
<updated>2022-08-11T14:22:00+09:00</updated>
<rights>技術評論社 2022</rights>
<icon>https://gihyo.jp/assets/templates/gihyojp2007/image/header_logo_gihyo.gif</icon>
<entry>
<title>番外編●特別コラム［関数プログラミング実践入門 ──簡潔で、正しいコードを書くために］ ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6926-2/0002"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6926-2/0002</id>
<published>2014-11-14T10:46:00+09:00</published>
<updated>2014-11-14T10:46:00+09:00</updated>
<author>
<name>大川徳之</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>長らく歴史のある「関数プログラミング」ですが，最近，種々の条件が揃いはじめ，ますますよく登場するキーワードになりつつあるようです。</summary>
</entry>
<entry>
<title>本書について［関数プログラミング実践入門 ──簡潔で、正しいコードを書くために］ ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6926-2/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6926-2/0001</id>
<published>2014-11-14T10:45:00+09:00</published>
<updated>2014-11-14T10:45:00+09:00</updated>
<author>
<name>大川徳之</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>「関数プログラミング」は，関数型言語プログラマのみならず，すべてのプログラマにとっても急激に身近なものになってきました。</summary>
</entry>
<entry>
<title>本書について［クラウドを支える技術 ──データセンターサイズのマシン設計法］ ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6730-5/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6730-5/0001</id>
<published>2014-09-26T13:14:00+09:00</published>
<updated>2014-09-26T13:14:00+09:00</updated>
<author>
<name>技術評論社</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>コンピューティングがクラウド（Cloud）に移行するにつれて，インターネットで使用されるコンピュータプラットフォームは宅配ピザの箱や冷蔵庫のような格好ではなく，倉庫（Warehouse）いっぱいのコンピュータ群になってきています。</summary>
</entry>
<entry>
<title>はじめに ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6500-4/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6500-4/0001</id>
<published>2014-05-19T10:47:00+09:00</published>
<updated>2014-05-19T10:47:00+09:00</updated>
<author>
<name>安藤祐介</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>CakePHPを主に取り上げた書籍が日本で最初に出版されたのは，2007年10月のことでした。</summary>
</entry>
<entry>
<title>本書について ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6426-7/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6426-7/0001</id>
<published>2014-04-25T11:17:00+09:00</published>
<updated>2014-04-25T11:17:00+09:00</updated>
<author>
<name>Hisa Ando</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>コンピュータは，普及が著しいスマートフォンやタブレットに使われており，GoogleやFacebookなどのデータセンターにも大量に使われています。</summary>
</entry>
<entry>
<title>はじめに ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6428-1/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6428-1/0001</id>
<published>2014-04-15T10:56:00+09:00</published>
<updated>2014-04-15T10:56:00+09:00</updated>
<author>
<name>技術評論社</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>本書は「チーム開発実践入門」です。読者のみなさんの中にはよくご存じの方も多いかとは思いますが，チーム開発というのは複雑で難しいものです。</summary>
</entry>
<entry>
<title>はじめに ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6366-6/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6366-6/0001</id>
<published>2014-03-13T11:57:00+09:00</published>
<updated>2014-03-13T11:57:00+09:00</updated>
<author>
<name>技術評論社</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>本書は，世界中の開発者が行っているGitHubを利用した開発方法を，みなさんが現場で使えるようになるためのガイドとして執筆しました。</summary>
</entry>
<entry>
<title>はじめに ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6286-7/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-6286-7/0001</id>
<published>2014-02-07T13:50:00+09:00</published>
<updated>2014-02-07T13:50:00+09:00</updated>
<author>
<name>技術評論社</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>インフラデザインパターンは，インフラ開発における問題発生の抑制や生産性の向上，人材育成などを目的に，インフラ技術者たちが編み出した設計方式を概念化・抽象化して名前（パターン名）を付け，その特徴や留意点を記載したものです。</summary>
</entry>
<entry>
<title>はじめに ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5654-5/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5654-5/0001</id>
<published>2013-04-17T11:31:00+09:00</published>
<updated>2013-04-17T11:31:00+09:00</updated>
<author>
<name>西尾泰和</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>世の中にはたくさんのプログラミング言語があります。読むべきドキュメントもたくさんあります。しかしあなたの使える時間は有限です。すべてを学ぶことはできません。</summary>
</entry>
<entry>
<title>はじめに ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5377-3/0002"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5377-3/0002</id>
<published>2012-11-07T11:00:01+09:00</published>
<updated>2012-11-07T11:00:01+09:00</updated>
<author>
<name>渡辺修司</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>本書はJavaプログラマを対象としたJUnitによるユニットテストの実践ガイドです。</summary>
</entry>
<entry>
<title>推薦のことば ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5377-3/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5377-3/0001</id>
<published>2012-11-07T11:00:00+09:00</published>
<updated>2012-11-07T11:00:00+09:00</updated>
<author>
<name>和田卓人</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>みなさんは，JUnitでユニットテストを書いていますか？</summary>
</entry>
<entry>
<title>第1章　JavaScript入門準備 ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5376-6/0002"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5376-6/0002</id>
<published>2012-10-31T10:46:00+09:00</published>
<updated>2012-10-31T10:46:00+09:00</updated>
<author>
<name>外村和仁</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>WEB+DB PRESS Plusシリーズ「ノンプログラマのためのJavaScriptはじめの一歩」の第1章です。本章ではまず，プログラムを初めて学ぶ人に向けて，プログラムを学ぶうえでの心構えを説明します。</summary>
</entry>
<entry>
<title>はじめに ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5376-6/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5376-6/0001</id>
<published>2012-10-31T10:45:00+09:00</published>
<updated>2012-10-31T10:45:00+09:00</updated>
<author>
<name>外村和仁</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>JavaScriptは現在，Webアプリケーションを作るうえで欠かせないプログラミング言語となっています。</summary>
</entry>
<entry>
<title>はじめに ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5324-7/0002"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5324-7/0002</id>
<published>2012-09-28T10:36:00+09:00</published>
<updated>2012-09-28T10:36:00+09:00</updated>
<author>
<name>安藤祐介</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>CakePHPを主に取り上げた書籍が日本で最初に出版されたのは，2007年10月のことでした。</summary>
</entry>
<entry>
<title>本書に寄せて ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5324-7/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5324-7/0001</id>
<published>2012-09-28T10:35:00+09:00</published>
<updated>2012-09-28T10:35:00+09:00</updated>
<author>
<name/>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>私は12年間，PHP開発者として働いてきて，開発者として，スピーカーとして，そしてカンファレンスやコミュニティ活動に関わる一個人として成長したと思います。</summary>
</entry>
<entry>
<title>はじめに『Emacs実践入門―思考を直感的にコード化し，開発を加速する』 ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5002-4/0002"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5002-4/0002</id>
<published>2012-03-05T11:26:00+09:00</published>
<updated>2012-03-05T11:26:00+09:00</updated>
<author>
<name>大竹智也</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>Wikipediaに次のように書かれています。</summary>
</entry>
<entry>
<title>本書に寄せて『Emacs実践入門―思考を直感的にコード化し，開発を加速する』 ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5002-4/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-5002-4/0001</id>
<published>2012-03-05T11:25:00+09:00</published>
<updated>2012-03-05T11:25:00+09:00</updated>
<author>
<name>技術評論社</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>私はEmacs使いです。最初にEmacsに接したのは，私がまだ大学生だったころの1988年のことです。</summary>
</entry>
<entry>
<title>はじめに『日本語入力を支える技術 ―変わり続けるコンピュータと言葉の世界』 ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-4993-6/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-4993-6/0001</id>
<published>2012-02-09T11:19:00+09:00</published>
<updated>2012-02-09T11:19:00+09:00</updated>
<author>
<name>徳永拓之</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>本書は，コンピュータで日本語を入力する際に必要となるソフトウェアについての本です。</summary>
</entry>
<entry>
<title>はじめに『Jenkins実践入門　～ビルド・テスト・デプロイを自動化する技術』 ── WEB+DB PRESS plusシリーズ</title>
<link href="https://gihyo.jp/magazine/wdpress/plus/978-4-7741-4891-5/0001"/>
<id>https://gihyo.jp/magazine/wdpress/plus/978-4-7741-4891-5/0001</id>
<published>2011-11-09T11:00:00+09:00</published>
<updated>2011-11-09T11:00:00+09:00</updated>
<author>
<name>佐藤聖規</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/plus" term="WEB+DB PRESS plusシリーズ" xml:lang="ja"/>
<summary>みなさん，ソフトウェア・システム開発の現場でこんなことに困っていませんか？</summary>
</entry>
<entry>
<title>WEB+DB PRESS総集編に寄せて（書き下ろしエッセイの執筆陣より）</title>
<link href="https://gihyo.jp/magazine/wdpress/sp/978-4-7741-4831-1/0001"/>
<id>https://gihyo.jp/magazine/wdpress/sp/978-4-7741-4831-1/0001</id>
<published>2011-10-14T13:06:00+09:00</published>
<updated>2011-10-14T13:06:00+09:00</updated>
<author>
<name>技術評論社</name>
</author>
<category scheme="https://gihyo.jp/magazine/wdpress/sp" term="" xml:lang="ja"/>
<summary/>
</entry>
</feed>
"""
    private let profileXml: String = """
<プロフィール>
    <名前>日向強</名前>
    <所属>株式会社Amazia</所属>
    <過去のiOSDC>
        <タイトル year="2019">BLEでiOS/Android間でそこそこ大きなサイズのデータ通信を実現する (L2CAPもあるよ)</タイトル>
        <タイトル year="2020">詳解Storyboard</タイトル>
        <タイトル year="2020">あなたの知らない連絡先の世界</タイトル>
        <タイトル year="2021">バックグラウンドでアプリがキルされても怖くない！アプリの状態を元に戻すリストア機能の全て</タイトル>
    </過去のiOSDC>
    <好きな3DO>REAL</好きな3DO>
    <特技>遠くでテレビの電源が入ったことがわかる</特技>
</プロフィール>
"""
}
