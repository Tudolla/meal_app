import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/model/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.onselect,
  });

  final Category category;
  final void Function() onselect;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselect,
      splashColor: Theme.of(context).highlightColor,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
