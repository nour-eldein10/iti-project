import 'package:flutter/material.dart';
import '../api/api_provider.dart';
import '../api/product_model.dart';
import '../components/product_card.dart';
import '../components/product_details.dart';

class CategoryProductsPage extends StatefulWidget {
  final String category;

  const CategoryProductsPage({Key? key, required this.category}) : super(key: key);

  @override
  _CategoryProductsPageState createState() => _CategoryProductsPageState();
}

class _CategoryProductsPageState extends State<CategoryProductsPage> {
  final ApiProvider _apiProvider = ApiProvider();
  List<ProductElement> _products = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadCategoryProducts();
  }

  Future<void> _loadCategoryProducts() async {
    try {
      Product productsData;

      if (widget.category == 'All') {
        productsData = await _apiProvider.getProducts(limit: 20);
      } else {
        productsData = await _apiProvider.getProductsByCategory(widget.category);
      }

      setState(() {
        _products = productsData.products;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  void _navigateToProductDetails(ProductElement product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(product: product),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.category} Products',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.deepPurple))
          : _errorMessage.isNotEmpty
          ? Center(child: Text('Error: $_errorMessage'))
          : _products.isEmpty
          ? Center(child: Text('No products found in this category'))
          : GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.7,
        ),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return ProductCard(
            product: product,
            onTap: () => _navigateToProductDetails(product),
          );
        },
      ),
    );
  }
}