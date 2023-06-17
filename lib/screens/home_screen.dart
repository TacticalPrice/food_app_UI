import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app_ui/screens/restaurant_screen.dart';
import 'package:food_delivery_app_ui/screens/cart_screen.dart';

import '../data/data.dart';
import '../modules/restaurant.dart';
import '../widgets/recent_orders.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Food Genie"),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.account_circle, size: 30)),
        actions: [
          TextButton(
             onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartScreen())),
            child: Text(
              "Cart(${currentUser.cart.length})",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),

      body: ListView(
        children: [
          Padding(padding: const EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(width: 0.8),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  width: 0.8,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              hintText: "Search Food or Restaurants",
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {},
              ),
            ),
          

            
          )

      ),
      const RecentOrders(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Nearby Restaurants",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          _buildRestaurants()
        ]
        
      )
        ],
      ),
    );
  }
   _buildRestaurants() {
    final List<Widget> restaurantList = [];
    restaurants.forEach((Restaurant restaurant) {
      restaurantList.add(GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantScreen(restaurant: restaurant),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1.0, color: Colors.grey.shade200)),
          child: Expanded(
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Hero(
                    tag: restaurant.imageUrl,
                    child: Image(
                      width: 150,
                      height: 150,
                      image: AssetImage(restaurant.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          restaurant.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        RatingBar.builder(
                            initialRating: 5,
                            itemCount: restaurant.rating.toInt(),
                            allowHalfRating: true,
                            minRating: 1,
                            unratedColor: Colors.grey,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            itemBuilder: (context, _) =>
                                (const Icon(Icons.star, color: Colors.amber)),
                            onRatingUpdate: (rating) {
                              Text(restaurant.rating.toString());
                            }),
                        Text(
                          restaurant.address,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    });
    return Column(
      children: restaurantList,
    );
  }

}
