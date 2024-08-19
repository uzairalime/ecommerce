import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce/model/product_api_model.dart';

List<ProductDetails> productDetails = [];
Future<List<ProductDetails>> getProductApi() async {
  final response = await http.get(
      Uri.parse('https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg'));
  var data = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    for (var i = 0; i < data.length; i++) {
      ProductDetails product = ProductDetails(
        id: data[i]['id'],
        title: data[i]['title'],
        price: data[i]['price'],
        description: data[i]['description'],
        category: data[i]['category'],
        image: data[i]['image'],
      );
      productDetails.add(product);
    }
    return productDetails;
  } else {
    return productDetails;
  }
}
