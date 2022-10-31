import 'package:flutter/material.dart';
import 'components/RestaurantsListPage.dart';
import 'components/RestaurantsDetailPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: RestaurantsListPage.routeName,
      routes: {
        RestaurantsListPage.routeName: (context) => const RestaurantsListPage(),
        RestaurantDetailPage.routeName: (context) => RestaurantDetailPage(
              restaurant: ModalRoute.of(context)?.settings.arguments as dynamic,
            ),
      },
    );
  }
}
