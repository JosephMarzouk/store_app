import 'package:store_app/helper/api.dart';

class ALlCategoriesServies {
  Future<List<dynamic>> getALlCategories() async {
   List<dynamic> data=await Api().get(url: 'https://fakestoreapi.com/products/categories');
    
    return data;
  }
}
