import '../models/category.dart';

class CategoryOperations {
  CategoryOperations._() {}
  static List<Category> getCategories() {
    return <Category>[
      Category(
        'Adnan\nSami',
        'https://is3-ssl.mzstatic.com/image/thumb/Features115/v4/9b/f5/8f/9bf58f80-0f02-edca-ff6e-666d19c946f8/pr_source.png/486x486bb.png',
      ),
      Category(
        'MJ Hits',
        'https://i.scdn.co/image/ab67706c0000da84d6dc7779ffa596a3d73b4e35',
      ),
      Category(
        'Best of\nKK',
        'https://c-cl.cdn.smule.com/rs-s-sf-1/arr/c2/f0/33d7fbd1-cbae-475a-b963-6494d3163c97.jpg',
      ),
      Category(
        'Sherya\nGhoshal',
        'https://c-cl.cdn.smule.com/smule-gg-s-sf-bck4/arr/73/35/2bb93c00-5244-493f-a721-ffad2de189cd.jpg',
      ),
      Category(
        'Kishore',
        'https://c-cl.cdn.smule.com/rs-s78/arr/f5/4e/27b764f1-91f2-41e7-934a-5bedf8b1751a.jpg',
      ),
      Category(
        'Arijit\nSingh',
        'https://c-cl.cdn.smule.com/rs-s90/arr/5c/65/24fce9ff-7878-4c3a-b818-6a91ee37a2aa.jpg',
      )
    ];
  }
}
