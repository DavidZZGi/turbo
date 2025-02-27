import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../../place_repository/models/place/place.dart';

@RoutePage()
class BusinessDetailsScreen extends StatelessWidget {
  final Place place;

  const BusinessDetailsScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          _buildBackground(),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: place.imageUrls.length,
        itemBuilder: (context, index) {
          return Image.network(
            place.imageUrls[index],
            fit: BoxFit.cover,
            width: double.infinity,
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.6,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            children: [
              FadeInUp(
                child: Text(
                  place.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              FadeInUp(
                delay: const Duration(milliseconds: 200),
                child: Text(
                  place.description,
                  style: const TextStyle(
                      fontSize: 16, color: Color.fromARGB(179, 255, 255, 255)),
                ),
              ),
              const SizedBox(height: 10),
              _buildRating(),
              const SizedBox(height: 20),
              _buildReviews(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRating() {
    return FadeInUp(
      delay: const Duration(milliseconds: 400),
      child: Row(
        children: List.generate(5, (index) {
          return Icon(
            index < place.rating ? Icons.star : Icons.star_border,
            color: Colors.yellow,
          );
        }),
      ),
    );
  }

  Widget _buildReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Reseñas",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        ...place.reviews.map((review) => ListTile(
              title: Text(review.userName,
                  style: const TextStyle(color: Colors.white)),
              subtitle: Text(review.comment,
                  style: const TextStyle(color: Colors.white70)),
            )),
      ],
    );
  }
}
