import 'package:ecommerce/model/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductGetController extends GetxController {
  final RxList productList = <ProductModel>[].obs; // All Product list
  final RxList<String> categoryProductList = <String>[].obs; // Category List
  final RxList filteredProductList =
      <ProductModel>[].obs; // Filtered Products List
  final RxInt selectedIndex = 0.obs; // Selected Index

  @override
  void onInit() async {
    getProducts();
    super.onInit();
  }

// Filter Products based on Category
  getFilteredProducts(String category) {
    filteredProductList.clear();
    if (category == "All") {
      filteredProductList.addAll(productList);
    } else {
      filteredProductList.addAll(List<ProductModel>.from(
          productList.where((element) => element.category == category)));
    }
  }

  final RxBool isloading = false.obs;
  // Get Products from API
  getProducts() async {
    isloading.value = true;

    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      productList.clear();
      var data = json.decode(response.body);
      productList.addAll(
          List<ProductModel>.from(data.map((x) => ProductModel.fromJson(x))));
      // Get Category List
      if (productList.isNotEmpty) {
        for (int i = 0; i < productList.length; i++) {
          if (!categoryProductList.contains(productList[i].category)) {
            categoryProductList.add(productList[i].category);
          }
        }
      }
      if (!categoryProductList.contains("All")) {
        categoryProductList.insert(0, "All");
      }

      isloading.value = false;
      // Filter Products based on Category
      getFilteredProducts("All");
    }
  }
}
