import 'package:myapp/model/dish.dart';

class Restaurant {
  String id;
  String imagePath;
  String name;
  String description;
  double stars;
  double distance;
  List<String> categories;
  List<Dish> dishes;

  Restaurant({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.stars,
    required this.distance,
    required this.categories,
    required this.dishes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'stars': stars,
      'distance': distance,
      'categories': categories,
      'dishes': dishes.map((dish) => dish.toMap()).toList(),
    };
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      imagePath: json['imagePath'],
      name: json['name'],
      description: json['description'],
      stars: json['stars'],
      distance: json['distance'].toDouble(),
      categories: List<String>.from(json['categories']),
      dishes: List<Dish>.from(json['dishes'].map((dish)=>Dish.fromMap(dish))),
    );
  }

  @override
  String toString() {
     return 'Restaurant(id: $id, imagePath: $imagePath, name: $name, description: $description, stars: $stars, distance: $distance, categories: $categories)';
   }
}
