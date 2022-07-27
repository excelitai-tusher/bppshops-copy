class TrendingModel{
  String? imageUrl;
  String? productName;
  String? productDetail;
  String? productPrice;

  TrendingModel({this.imageUrl,this.productName,this.productDetail,this.productPrice});

  static List<TrendingModel> list=[
    TrendingModel(
      imageUrl: "images/ecom/woman/salwar/sl1.jpg",
      productName: "trending 1",
      productDetail: "product detail",
      productPrice: "1000.0",
    ),
    TrendingModel(
      imageUrl: "images/ecom/woman/salwar/sl3.png",
      productName: "trending 1",
      productDetail: "product detail",
      productPrice: "1000.0",
    ),
    TrendingModel(
      imageUrl: "images/ecom/woman/salwar/sl2.jpg",
      productName: "trending 1",
      productDetail: "product detail",
      productPrice: "1000.0",
    ),
    TrendingModel(
      imageUrl: "images/ecom/woman/salwar/sl4.jpg",
      productName: "trending 1",
      productDetail: "product detail",
      productPrice: "1000.0",
    ),
    TrendingModel(
      imageUrl: "images/ecom/woman/salwar/sl5.jpg",
      productName: "trending 5",
      productDetail: "product detail",
      productPrice: "1000.0",
    ),
  ];
}