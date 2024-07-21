import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category_view_model.dart';
import 'category.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Consumer<CategoryViewModel>(
        builder: (context, viewModel, child) {
          return ListView.builder(
            itemCount: viewModel.categories.length,
            itemBuilder: (context, index) {
              final category = viewModel.categories[index];
              return ListTile(
                title: Text(category.name),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    viewModel.removeCategory(category);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final viewModel = Provider.of<CategoryViewModel>(context, listen: false);
          viewModel.addCategory(Category('New Category ${viewModel.categories.length + 1}'));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
