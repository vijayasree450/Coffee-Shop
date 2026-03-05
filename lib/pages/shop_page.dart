import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../compontes/coffee_tile.dart';
import '../models/coffee_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addToCart(Coffee coffee) {
    // add coffee to cart
    Provider.of<CoffeeShop>(context, listen: false)
        .addItemToCart(coffee);

    // show snackbar
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('${coffee.name} added to cart'),
    //     duration: const Duration(seconds: 2),
    //   ),

       showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Added to cart'),
        content: Text('${coffee.name} added to cart'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
     );


    
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "How would you like your coffee?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),

              const SizedBox(height: 25),

              Expanded(
                child: ListView.builder(
                  itemCount: value.shop.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.shop[index];

                    return CoffeeTile(
                      coffee: eachCoffee,
                      icon: const Icon(Icons.add),
                      onPressed: () => addToCart(eachCoffee),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

