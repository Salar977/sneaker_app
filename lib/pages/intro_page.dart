import 'package:flutter/material.dart';
import 'package:sneaker_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [    
              // Logo at the top
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  'lib/images/nike.png',
                  height: 120,
                ),
              ),
          
              // some space between children
              const SizedBox(height: 60),
          
              // title
              const Text(
                'Just Do It',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
          
              // some space between children
              const SizedBox(height: 60),
          
              // sub title
              const Text(
                'Quality sneakers made from heaven! buy now and get 3 for free!',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 60),
          
              // start now buton
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => HomePage(),
                )),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12)
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Center(
                    child: Text(
                      'Shop Now',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}