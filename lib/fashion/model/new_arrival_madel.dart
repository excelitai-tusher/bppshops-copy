class NewArrivalModel{
  String? imageUrl;
  String? productName;
  String? productDetail;
  String? productPrice;
  String? productOffers;

  NewArrivalModel({this.imageUrl,this.productName,this.productDetail,this.productPrice,this.productOffers});

  static List<NewArrivalModel> list=[
    NewArrivalModel(
      imageUrl: "images/ecom/men/polo/polo1.jpg",
      productName: "polo 1",
      productDetail: "polo1 detail",
      productPrice: "12122 ",
      productOffers: "10% Off",
    ),
    NewArrivalModel(
      imageUrl: "images/ecom/men/polo/polo2.jpg",
      productName: "polo 2",
      productDetail: "polo2 detail",
      productPrice: "1234",
      productOffers: "10% Off",
    ),
    NewArrivalModel(
      imageUrl: "images/ecom/men/polo/polo5.jpg",
      productName: "polo 3",
      productDetail: "polo3 detail",
      productPrice: "1222",
      productOffers: "10% Off",
    ),
    NewArrivalModel(
      imageUrl: "images/ecom/men/polo/polo4.jpg",
      productName: "polo 4",
      productDetail: "polo4 detail",
      productPrice: "3000",
      productOffers: "10% Off",
    ),
    NewArrivalModel(
      imageUrl: "images/ecom/men/polo/polo1.jpg",
      productName: "polo 1",
      productDetail: "polo1 detail",
      productPrice: "4882",
      productOffers: "10% Off",
    ),
    NewArrivalModel(
      imageUrl: "images/ecom/men/polo/polo2.jpg",
      productName: "polo 2",
      productDetail: "polo2 detail",
      productPrice: "2342",
      productOffers: "10% Off",
    ),
    NewArrivalModel(
      imageUrl: "images/ecom/men/polo/polo5.jpg",
      productName: "polo 3",
      productDetail: "polo3 detail",
      productPrice: "polo3 price ",
      productOffers: "10% Off",
    ),
    NewArrivalModel(
      imageUrl: "images/ecom/men/polo/polo4.jpg",
      productName: "polo 4",
      productDetail: "polo4 detail",
      productPrice: "1225",
      productOffers: "10% Off",
    ),
  ];
}