class ProductModel {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final num rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  ProductModel(
      this.id,
      this.title,
      this.description,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images);

  static ProductModel fromJson(Map<String, dynamic> json) => ProductModel(
      json['id'],
      json['title'],
      json['description'],
      json['price'],
      json['discountPercentage'],
      json['rating'],
      json['stock'],
      json['brand'],
      json['category'],
      json['thumbnail'],
      json['images']);
}
