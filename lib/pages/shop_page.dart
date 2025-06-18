import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_app/components/shoe_tile.dart';
import 'package:sneaker_app/models/cart.dart';
import 'package:sneaker_app/models/shoes.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe successfully added to cart
    showDialog(
      context: context,
      builder: (context) {
        // Auto-close the dialog after 2 seconds
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pop(true);
        });

        return AlertDialog(
          title: Text('Successfully added!'),
          content: Text('Check your cart'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder:
          (context, value, child) => Column(
            children: [
              // search bar
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),

              // nice message
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  'Everyone flies.. some fly longer than others',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),

              // hot picks for this week
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Hot picks for this Week! 🔥',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text('See all', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // List of shoes on sale
              Expanded(
                child: ListView.builder(
                  itemCount: value.getShoeList().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // get shoe from shoe shop
                    Shoe shoe = value.getShoeList()[index];

                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Divider(color: Colors.transparent),
              ),
            ],
          ),
    );
  }
}
