import '../models/category.dart';

class CategoryOperations {
  CategoryOperations._() {}
  static List<Category> getCategories() {
    return <Category>[
      Category(
        'High\nHeels',
        'https://is4-ssl.mzstatic.com/image/thumb/Music112/v4/b7/39/58/b739588e-58f3-1a1f-df20-39fad0bbc9a4/8720765119596.png/316x316bb.webp',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview126/v4/b0/57/d1/b057d136-7ef0-fcff-0b46-ea6594516805/mzaf_13685112609860086091.plus.aac.p.m4a',
      ),
      Category(
          'Kabir Singh',
          'https://c-cl.cdn.smule.com/smule-gg-s-sf-bck3/arr/35/96/a3829b1b-83d9-4a67-9a41-817230a485ce.jpg',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/02/c2/cf/02c2cf03-3496-cdd8-23b0-06ffee8a63e3/mzaf_12568138179740230131.plus.aac.p.m4a'),
      Category(
        'Blue\nEyes',
        'https://is5-ssl.mzstatic.com/image/thumb/Music71/v4/81/0b/a4/810ba47e-952c-8818-ad3c-9899b4928cd4/8902894354943_cover.jpg/316x316bb.webp',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/1a/44/fb/1a44fbe0-5172-ddad-8e53-5510ad7dcff9/mzaf_11119624523547880630.plus.aac.p.m4a',
      ),
      Category(
        'Om\nShanti\nOm',
        'https://is4-ssl.mzstatic.com/image/thumb/Music115/v4/2d/16/82/2d168217-2477-356c-744b-d0dc2d7acb68/8902894623179_cover.jpg/316x316bb.webp',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/e8/bf/3e/e8bf3e6c-c7de-418a-7b57-9121accfe7a3/mzaf_5986831054656247478.plus.aac.p.m4a',
      ),
      Category(
        'Guru\nRandhawa',
        'https://is3-ssl.mzstatic.com/image/thumb/Music118/v4/10/60/3f/10603f32-7127-72b5-f95e-a36e9937eb35/8903431656599_cover.jpg/316x316bb.webp',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/f3/4d/48/f34d4839-90b5-730c-b116-7d1c32e60228/mzaf_6198682250574026402.plus.aac.p.m4a',
      ),
      Category(
        'Arijit\nSingh',
        'https://c-cl.cdn.smule.com/rs-s90/arr/5c/65/24fce9ff-7878-4c3a-b818-6a91ee37a2aa.jpg',
        'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/db/a6/77/dba677db-5b64-0a2d-c19f-0f18d8fcc040/mzaf_18437633248411199823.plus.aac.p.m4a',
      )
    ];
  }
}
