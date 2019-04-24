class ProductModel {
  String title;

  ProductModel({this.title});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(title: json['title']);
  }
}
