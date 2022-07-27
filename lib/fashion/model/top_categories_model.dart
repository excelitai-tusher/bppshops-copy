class TopCategoriModel{
  String? categoriName;
  String? imagePath;
  String? items;

  TopCategoriModel({this.categoriName,this.imagePath,this.items,});
  static List<TopCategoriModel> list=[
    TopCategoriModel(
      categoriName: "Popular",
      imagePath: "images/popular.png",
      items: "12 items",
    ),
    TopCategoriModel(
        categoriName: "Electronics",
        imagePath: "images/phone.png",
        items: "7 items",
    ),
    TopCategoriModel(
        categoriName: "Fashion",
        imagePath: "images/fashion.png",
        items: "3 items",
    ),
    TopCategoriModel(
        categoriName: "Bikes",
        imagePath: "images/bike.png",
        items: "2 items",
    ),
    TopCategoriModel(
        categoriName: "Food",
        imagePath: "images/food.png",
        items: "7 items",
    ),
    TopCategoriModel(
        categoriName: "Popular",
        imagePath: "images/popular.png",
        items: "3 items",
    ),
  ];
}