import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_view_model.dart';
import 'product.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Manager'),
      ),
      body: Consumer<ProductViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.products.length,
            itemBuilder: (context, index) {
              final product = viewModel.products[index];
              return ListTile(
                title: Text(product.name),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    viewModel.removeProduct(product);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final viewModel = Provider.of<ProductViewModel>(context, listen: false);
          viewModel.addProduct(Product('New Product ${viewModel.products.length + 1}'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
