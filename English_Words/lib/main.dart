// import 'package:flutter/material.dart';
// import 'util/dbhelper.dart';
// import '../models/list_items.dart';
// import '../models/shopping_list.dart';
// import 'ui/items_screen.dart';
// import 'ui/shopping_list_dialog.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // DbHelper helper = DbHelper();
//     // helper.testDb();/**/
//     return MaterialApp(
//       title: 'Shopping List',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ShList()
//     );
//   }
// }

// class ShList extends StatefulWidget {
//   const ShList({Key? key}) : super(key: key);

//   @override
//   State<ShList> createState() => _ShListState();
// }

// class _ShListState extends State<ShList> {
//   List<ShoppingList>? shoppingList;
//   DbHelper helper = DbHelper();
//   ShoppingListDialog? dialog;

//   @override
//   void initState() {
//     // TODO: implement initState
//     dialog = ShoppingListDialog();
//     super.initState();
//   }

//   Future showData()async{
//     await helper.openDb();
//     shoppingList = await helper.getLists();
//     setState(() {
//       shoppingList = shoppingList;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     ShoppingListDialog dialog = ShoppingListDialog();
//     showData();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Shopping List"),
//       ),

//       body: ListView.builder(
//         itemCount: (shoppingList != null)? shoppingList!.length: 0,
//       itemBuilder: (BuildContext context, int index){
//         return Dismissible(
//           key: Key(shoppingList![index].name!),
//           onDismissed: (direction){
//             String strName = shoppingList![index].name!;
//             helper.deleteList(shoppingList![index]);

//             setState(() {
//               shoppingList!.removeAt(index);
//             });
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text("$strName deleted"))
//             );
//           },
//           child: ListTile(
//             title: Text(shoppingList![index].name!),
//             leading: CircleAvatar(child:
//               Text(shoppingList![index].priority.toString()),),
//             trailing: IconButton(
//               icon: Icon(Icons.edit),
//               onPressed: (){
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) => dialog!.buildDialog(context,
//                         shoppingList![index], false));
//               },),
//             onTap: (){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context)=>
//                 ItemsScreen(shoppingList: shoppingList![index]))
//               );
//             },
//           ),
//         );
//       },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//           showDialog(
//               context: context,
//               builder: (BuildContext context) =>
//                   dialog!.buildDialog(context, ShoppingList(0, '', 0), true));
//         },
//         backgroundColor: Colors.pink,
//         child: Icon(Icons.add),
//       ),
//     );

//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   List<Container> GridListTile(int count) => List.generate(
//       count,
//       (i) => Container(
//           child: Center(child: Text('item${i}')),
//           decoration: BoxDecoration(
//               color: Color.fromARGB(217, 255, 255, 255),
//               border: Border.all(color: Colors.brown, width: 2.0))));
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: Text('lecture class')),
//             body: Column(
//               children: [
//                 Expanded(child:ListView.builder(
//                   itemCount: 4,
//                   padding: EdgeInsets.only(left:35),
//                   itemBuilder: ((context, index) {
//                     return ListTile(
//                       contentPadding: EdgeInsets.all(20),
//                       title:Text('List${index}'), 
//                       subtitle: Text("${index}"),
//                       leading: Icon(Icons.ac_unit_rounded),
//                       );
//                   }),
//                 )),
//                 Text('hello'),
//                 Stack(
//                   alignment: Alignment(8.6,0.6),
//                   children: [
//                     Container(
//                       color: Colors.amber,
//                       height: 100,
//                       width: 80,
//                     ),
//                     Container(
//                       color: Colors.red,
//                       height: 90,
//                       width: 60,
//                     ),
//                     Container(
//                       color: Colors.green,
//                       height: 60,
//                       width: 40,
//                     )
//                   ],
//                 ),
//                 Expanded(
//                   child: (Container(
//                     child: GridView.extent(
//                 maxCrossAxisExtent: 200,
//                 padding: EdgeInsets.all(10),
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 children: GridListTile(16),
//                   ))
//               ))
//             ]
//             )
            // )
            // body:GridView.builder(
            //   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount:2,
            //     crossAxisSpacing:10.0,
            //     mainAxisSpacing:10.0,

            //   ),
            //   itemCount:10,
            //   itemBuilder:(context,index){
            //     return Container(
            //       color:Colors.blue,
            //       child:Center(child:Text('hello', style:TextStyle(color: Colors.white, fontSize: 20.0),))
            //     );
            //   }
            // )
//             ));
//   }
// }


import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create:(context)=>MyAppState(),
      child:MaterialApp(
        title:'Namer App',
        theme:ThemeData(
          useMaterial3:true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),

        ),
        home: MyHomePage()
      ),
    );
  }
}

class MyAppState extends ChangeNotifier{
  var current = WordPair.random();

  void getNext(){
    current=WordPair.random();
    notifyListeners();
  }
  var favorites=<WordPair>[];
  void togglerFavorite(){
    if (favorites.contains(current)){
      favorites.remove(current);
    }else{
      favorites.add(current);
    }
    notifyListeners();
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();
//     var pair=appState.current;
//     IconData icon;
//     if(appState.favorites.contains(pair)){
//       icon=Icons.favorite;
//     }else{
//       icon=Icons.favorite_border;
//     }
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment:MainAxisAlignment.center,
//           children: [
//             // Text('A random Awesome idea:'),
//             BigCard(pair: pair),
//             SizedBox(height:20),
//             Row(
//               mainAxisAlignment:MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed:(){
//                     appState.togglerFavorite();
//                   },
//                   child:Row(
//                     mainAxisSize:MainAxisSize.min,
//                     children:[
//                       Icon(icon),
//                       Text('Like'), 
//                     ]
//                   )
//                 ),
//                 SizedBox(width:20),
//                 ElevatedButton(
//                   onPressed:(){
//                     appState.getNext();
//                   },
//                   child:Text('Next')
//                 ),
                
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// ...

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex){
      case 0:
        page=GeneratorPage();
        break;
      case 1:
        page=FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return Builder(
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              body: Row(
                children: [
                  SafeArea(
                    child: NavigationRail(
                      extended: constraints.maxWidth >=600,
                      destinations: [
                        NavigationRailDestination(
                          icon: Icon(Icons.home),
                          label: Text('Home'),
                        ),
                        NavigationRailDestination(
                          icon: Icon(Icons.favorite),
                          label: Text('Favorites'),
                        ),
                      ],
                      selectedIndex: selectedIndex,
                      onDestinationSelected: (value) {
                        setState((){
                          selectedIndex=value;
                        }
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: page,
                    ),
                  ),
                ],
              ),
            );
          }
        );
      }
    );
  }
}


class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.togglerFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ...


class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme=Theme.of(context);
    final style=theme.textTheme.displayMedium!.copyWith(
      color:theme.colorScheme.onPrimary,
    );


    return Card(
      color:theme.colorScheme.surface,
      child: Padding(
        padding:EdgeInsets.all(20.0),
        child:Text(
          pair.asLowerCase, 
          style:style,
          semanticsLabel:'${pair.first} ${pair.second}',
        ),
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    var appState=context.watch<MyAppState>();

    if (appState.favorites.isEmpty){
      return const Center(
        child:  Text('no favorites yet.')
      );
    }

    return ListView(
      children:[
        Padding(
          padding:EdgeInsets.all(20),
          child:Text('you have ${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading:Icon(Icons.favorite),
            title:Text(pair.asLowerCase),
          )
      ]
    );
  }
}