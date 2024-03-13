import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custombutton.dart';
import 'package:store_app/widgets/customtextfield.dart';

class UpdateProductScreen extends StatefulWidget {
  const UpdateProductScreen({super.key});
  static String id = 'UpdateProductScreen';

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  String? productName, image, description;

  String? productPrice;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Update Product',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextField(
                    hintText: 'Product Name',
                    onChanged: (data) {
                      productName = data;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    hintText: 'Description',
                    onChanged: (data) {
                      description = data;
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    hintText: 'Price',
                    onChanged: (data) {
                      productPrice = data;
                    },
                    inputType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomTextField(
                    hintText: 'image',
                    onChanged: (data) {
                      image = data;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomButon(
                    text: 'Update',
                    onTap: () async {
                      isLoading = true;
                      setState(() {});
                      try {
                       await updateMethod(product);
                         print('sucsess');
                      } on Exception catch (e) {
                        print(e.toString());
                        isLoading = false;
                        setState(() {});
                      }
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future <void> updateMethod(ProductModel product) async{
    await UpdateProduct().updateProduct(
      id: product.id,
        title: productName==null ? product.title:productName!,
        price: productPrice==null ? product.price.toString() : productPrice!,
        desc: description==null ? product.description : description!,
        image: image==null? product.image: image!,
        category: product.category);
    
  }
}
