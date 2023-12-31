import 'package:food_delivery_app_ui/modules/restaurant.dart';

import 'food.dart';

class Order {
  final Restaurant restaurant;
  final Food food;
  final String date;
  final int quantity;

  Order(
      {required this.restaurant,
      required this.food,
      required this.date,
      required this.quantity});
}