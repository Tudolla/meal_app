import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FilterScreenState();
  }
}
enum Filter{
  glutenFree,
  lactoseFree,
  vegeFree,
  

}

class _FilterScreenState extends State<FilterScreen> {
  var _filterSet = false;
  var _meatSet = false;
  var _vegetableSet = false;

  var _fishSet = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop){
          if(didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _filterSet,
            Filter.lactoseFree: _meatSet,
            Filter.vegeFree: _vegetableSet,
          });
        },
        
        child: Column(
          children: [
            SwitchListTile(
              value: _filterSet,
              onChanged: (isChecked){
                setState(() {
                _filterSet = isChecked;
                  
                });
              },
              title: Text(
                'Filter a ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only a filter to this',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 30, right: 20),
            ),
        
            SwitchListTile(
              value: _meatSet,
              onChanged: (isChecked){
                setState((){
                _meatSet = isChecked;
        
                });
              },
              title: Text(
                'meat filter ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only meat filter this',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 30, right: 20),
            ),
        
             SwitchListTile(
              value: _vegetableSet,
              onChanged: (isChecked){
                setState(() {
                _vegetableSet = isChecked;
                  
                });
              },
              title: Text(
                'vegetable ',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only vegetable this',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 30, right: 20),
            ),
        
            
          ],
        ),
      ),
    );
  }
}
