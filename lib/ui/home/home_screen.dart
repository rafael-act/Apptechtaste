import 'package:flutter/material.dart';
import 'package:myapp/data/categories_data.dart';
import 'package:myapp/data/restaurant_data.dart';
import 'package:myapp/model/restaurant.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/widgets/app_bar.dart';
import 'package:myapp/ui/home/widgets/category_widgets.dart';
import 'package:myapp/ui/home/widgets/listtile_widgets.dart';
import 'package:myapp/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('João da Silva'),
              accountEmail: Text('joao@email.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              ),
              decoration: BoxDecoration(color: AppColors.backgroundGrayCard),
            ),
            customTile(
              icon: Icons.home,
              title: 'Home',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            customTile(
              icon: Icons.shopping_bag,
              title: 'Sacola',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            customTile(
              icon: Icons.person,
              title: 'Minha Conta',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              SizedBox(height: 32.0),
              Text(
                "Boas Vindas!",
                style: TextStyle(fontSize: 22.0, color: AppColors.lightOrange),
              ),
              SizedBox(height: 32.0),
              TextFormField(
                decoration: InputDecoration(hintText: "Digite seu prato"),
                cursorColor: AppColors.mainColor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14.0),
                child: Text(
                  "Escolha por categoria",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: AppColors.lightOrange,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 12.0,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoryWidgets(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Image.asset('assets/banners/banner_promo.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text("Bem avaliados"),
              ),
              Column(
                spacing: 16.0,
                children: List.generate(restaurantData.listRestaurant.length, (
                  index,
                ) {
                  Restaurant restaurant = restaurantData.listRestaurant[index];
                  return RestaurantWidget(restaurant: restaurant);
                }),
              ),
              SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
