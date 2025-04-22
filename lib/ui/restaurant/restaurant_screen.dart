import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:myapp/ui/_core/widgets/app_bar.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Center(
        child: Column(
          spacing: 12.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/${restaurant.imagePath}', width: 128),
            Text(
              'Mais Pedidos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            Column(
              spacing: 12.0,
              children: List.generate(restaurant.dishes.length, (index) {
                Dish dish = restaurant.dishes[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Image.asset(
                        'assets/${dish.imagePath}', 
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                  title: Text(dish.name),
                  subtitle: Text('R\$:${dish.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<BagProvider>().addAllDishes([dish]);
                    },
                    icon: Icon(Icons.add),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
