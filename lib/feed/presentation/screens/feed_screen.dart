import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/feed_widgets.dart';

@RoutePage()
class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(245, 245, 247, 0.6)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBarWidget(),
                SizedBox(height: 16),
                Text(
                  "Explore the beauty\nof our planet",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                CategoryTabs(
                  categories: [
                    "Popular",
                    "Hot offers",
                    "Last minute",
                    "More..."
                  ],
                  onCategorySelected: (index) {
                    print("Seleccionado: ${index}");
                  },
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 260,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            PlaceCard(
                              imageUrl: "assets/images/mountains.jpg",
                              title: "Chilly Mountains",
                              description:
                                  "Discover what rest really means at these beautiful, cold mountains.",
                              price: "\$499",
                            ),
                            PlaceCard(
                              imageUrl: "assets/images/japan.jpg",
                              title: "Japanese Rest",
                              description:
                                  "Explore the fantastic cherry blossoms in Japan.",
                              price: "\$399",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      CategoriesSection(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
