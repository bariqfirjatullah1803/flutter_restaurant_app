import 'package:flutter/material.dart';
import 'package:my_app/components/RestaurantsDetailPage.dart';
import 'package:my_app/models/restaurant.dart';
import '../components/RestaurantsListPage.dart';

class RestaurantsListPage extends StatelessWidget {
  static const routeName = '/restaurants_list';
  const RestaurantsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    String date = DateTime.now().toString().substring(0, 10);
    return Scaffold(
      backgroundColor: Colors.pink[800],
      body: Column(
        children: <Widget>[
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Halo, selamat datang !',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                date,
                                style: TextStyle(color: Colors.pink[200]),
                              ),
                            ],
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Colors.pink[600],
                                  borderRadius: BorderRadius.circular(12)),
                              padding: EdgeInsets.all(12),
                              child: const Icon(
                                Icons.food_bank,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: const TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)))),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text(
                              'Mau makan dimana ?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            )
                          ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(25.0),
                    topLeft: Radius.circular(25.0)),
                color: Colors.grey[300],
              ),
              child: FutureBuilder<String>(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/local_restaurant.json'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    // loading widget
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasData) {
                      final List<RestaurantElement> restaurant =
                          parseRestaurant(snapshot.data!);
                      return ListView.builder(
                          itemCount: restaurant.length,
                          itemBuilder: (context, index) {
                            return _buildRestaurantItem(
                                context, restaurant[index]);
                          });
                    } else {
                      return const Center(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantItem(
      BuildContext context, RestaurantElement restaurant) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
      child: InkWell(
        splashColor: Colors.pink[400],
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: 80,
                        minHeight: 80,
                        maxWidth: 80,
                        maxHeight: 80,
                      ),
                      child: Image.network(restaurant.pictureId,
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(Icons.location_city, size: 15),
                          Text(
                            restaurant.city,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const Icon(Icons.star, size: 14),
                          Text(
                            restaurant.rating.toString(),
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: restaurant);
        },
      ),
    );
  }
}
