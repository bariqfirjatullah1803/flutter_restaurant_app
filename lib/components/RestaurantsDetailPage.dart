import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final RestaurantElement restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: restaurant.id,
                child: Image.network(restaurant.pictureId),
              ),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            transform: Matrix4.translationValues(0.0, -20.0, 10.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0)),
              color: Colors.white,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                restaurant.name,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star),
                                Text(restaurant.rating.toString(),
                                    style:
                                        Theme.of(context).textTheme.headline5),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  restaurant.city,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Description',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            restaurant.description,
                            textAlign: TextAlign.justify,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Foods',
                          style: Theme.of(context).textTheme.headline6,
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height * 0.05),
                    width: (MediaQuery.of(context).size.width * 0.94),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: restaurant.menus.foods.map((foods) {
                          return SizedBox(
                            width: 150,
                            child: Card(
                              elevation: 2,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(foods.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Drinks',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: (MediaQuery.of(context).size.height * 0.05),
                    width: (MediaQuery.of(context).size.width * 0.94),
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: restaurant.menus.drinks.map((drinks) {
                          return SizedBox(
                            width: 150,
                            child: Card(
                              elevation: 2,
                              child: Column(
                                children: [
                                  Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(drinks.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
