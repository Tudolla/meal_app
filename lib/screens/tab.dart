import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/meals.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabScreen extends StatefulWidget{
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() {
    return _TabScreenState();
  }

}

class _TabScreenState extends State<TabScreen>{
  int _pageIndex = 0 ; 
  final List<Meal> _favoriteMeal = [];
  void _showMessenger(String mess){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mess)));
  }

  void _mealFavoriteStatus(Meal meal){
    final isExist = _favoriteMeal.contains(meal);
    if(isExist){
      setState(() {
      _favoriteMeal.remove(meal);

        
      });
      _showMessenger('Remove');
    }else{
      setState(() {
      _favoriteMeal.add(meal);

        
      });
      _showMessenger('Add');

    }
  }

  void _setScreen(String id){
    Navigator.of(context).pop();
    if(id == 'Setting'){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> FilterScreen()));

    }

  }

  void _selectPage(int index){
    setState(() {
      _pageIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _mealFavoriteStatus,);
    var pageTitle = 'Home';

    if(_pageIndex == 1){
      activePage = MealScreen( meals: _favoriteMeal, onToggleFavorite: _mealFavoriteStatus);
      pageTitle = 'Favorite Page';
    }
    // TODO: implement build
    return Scaffold(
      drawer: MainDrawer(onTapScreen: _setScreen),
      appBar: AppBar(title: Text(pageTitle),),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _pageIndex,
        items:const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favors'),
        
      ],),
    );
  }

}