import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;  // Use http package to make API calls

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();  // Fetch products when the widget is initialized
  }

  Future<void> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body)['products'];  // Extract products from the response
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products List')),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(products[index]['thumbnail'], width: 50, height: 50),
                    title: Text(products[index]['title']),
                    subtitle: Text('\$${products[index]['price']}'),
                    onTap: () {
                      // You can add more functionality like navigation to details page here
                    },
                  ),
                );
              },
            ),
    );
  }
}
