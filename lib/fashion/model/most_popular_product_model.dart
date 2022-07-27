class MostPopularProductModel{
  String? productName;
  String? productPrice;
  String? imageUrl;

  MostPopularProductModel({this.productName,this.productPrice,this.imageUrl});

  static List<MostPopularProductModel> list=[
    MostPopularProductModel(
      productName: "Watch 2",
      productPrice: "1000.0",
      imageUrl: "images/ecom/men/watch/watch2.png",
    ),
    MostPopularProductModel(
      productName: "Dior Perfume",
      productPrice: "1000.0",
      imageUrl: "images/perfume1.png",
    ),
    MostPopularProductModel(
      productName: "HeadPhone",
      productPrice: "1000.0",
      imageUrl: "images/headPhone.png",
    ),
    MostPopularProductModel(
      productName: "Watch 2",
      productPrice: "1000.0",
      imageUrl: "images/ecom/men/watch/watch2.png",
    ),
    MostPopularProductModel(
      productName: "Dior Perfume",
      productPrice: "1000.0",
      imageUrl: "images/perfume1.png",
    ),
    MostPopularProductModel(
      productName: "HeadPhone",
      productPrice: "1000.0",
      imageUrl: "images/headPhone.png",
    ),
  ];
}