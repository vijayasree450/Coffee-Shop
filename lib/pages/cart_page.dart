import 'package:coffee_shop/compontes/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPages extends StatefulWidget {
  const CartPages({super.key});

  @override
  State<CartPages> createState() => _CartPagesState();
}

class _CartPagesState extends State<CartPages> {

  // REMOVE ITEM FROM CART
  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false)
        .removeItemFromCart(coffee);
  }

  // PAY NOW DIALOG
  void payNow() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Payment"),
        content: const Text("Are you sure you want to pay now?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Provider.of<CoffeeShop>(context, listen: false);
              Navigator.pop(context);
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                // TITLE
                const Text(
                  "Your Cart",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // EMPTY CART MESSAGE
                if (value.userCart.isEmpty)
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Your cart is empty",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                else
                  // CART ITEMS LIST
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.userCart.length,
                      itemBuilder: (context, index) {
                        Coffee eachcoffee = value.userCart[index];

                        return CoffeeTile(
                          coffee: eachcoffee,
                          icon: const Icon(Icons.delete),
                          onPressed: () => removeFromCart(eachcoffee),
                        );
                      },
                    ),
                  ),

                // PAY NOW BUTTON
                if (value.userCart.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: payNow,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Pay Now",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
