import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:turbo/app/routes/router/app_router.dart';
import 'package:turbo/app/utils/global/global_vars.dart';

import '../widgets/feed_widgets.dart';

@RoutePage()
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromRGBO(245, 245, 247, 0.6)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBarWidget(),
                const SizedBox(height: 16),
                const Text(
                  "Explora los mejores \nlugares y negocios",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                CategoryTabs(
                  categories: const [
                    "Populares",
                    "Mejores Ofertas",
                    "Trending",
                    "Precio-Calidad",
                  ],
                  onCategorySelected: (index) {
                    print("Seleccionado: ${index}");
                  },
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 260,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: places
                              .map(
                                (e) => InkWell(
                                    onTap: () => context.router
                                        .push(BusinessDetailsRoute(place: e)),
                                    child: PlaceCard(place: e)),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 16),
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
