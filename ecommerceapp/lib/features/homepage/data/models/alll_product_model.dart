class GetAllProductsModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;
  final String category;
  final RatingModel rating;

  GetAllProductsModel(
      {required this.rating,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.category});
  factory GetAllProductsModel.fromJson(json) {
    return GetAllProductsModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});
  factory RatingModel.fromJson(json) {
    return RatingModel(rate: json['rate'], count: json['count']);
  }
}
