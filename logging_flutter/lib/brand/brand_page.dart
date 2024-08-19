import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'brand_view_model.dart';
import 'brand.dart';

class BrandPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brands'),
      ),
      body: Consumer<BrandViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.brands.length,
            itemBuilder: (context, index) {
              final brand = viewModel.brands[index];
              return ListTile(
                title: Text(brand.name),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    viewModel.removeBrand(brand);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final viewModel = Provider.of<BrandViewModel>(context, listen: false);
          viewModel.addBrand(Brand('New Brand ${viewModel.brands.length + 1}'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
