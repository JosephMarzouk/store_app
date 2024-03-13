import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_product_service.dart';
import 'package:store_app/widgets/customcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {},
                icon:const Icon(FontAwesomeIcons.cartShopping, color: Colors.black))
          ],
          title: const Text(
            'New Trend',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left:15,right: 15,top: 60),
          child: FutureBuilder<List<ProductModel>>(
            future: GetAllProducts().getAllProductsList(),
            builder: (context, snapshot) 
          {
           if(snapshot.hasData)
           {
            List<ProductModel>products=snapshot.data!;
            return GridView.builder(
              itemCount: products.length,
            clipBehavior: Clip.none,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 60),
              itemBuilder: (context, index) {
                return customCard(product: products[index],);
              
              });
           }
           else
           {
            return const Center(child: CircularProgressIndicator());
           }
          }, )
        ));
  }
}
