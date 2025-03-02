import 'package:flutter/material.dart';

import '../../place_repository/models/place/place.dart';

class PlaceCard extends StatelessWidget {
  final Place place; // Asegúrate de que Place sea tu modelo de datos

  const PlaceCard({required this.place});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: SizedBox(
        width: 200, // Ancho fijo para la tarjeta
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del lugar
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                place.imageUrls.first, // URL de la imagen
                width: double.infinity, // Ocupa todo el ancho disponible
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            // Contenido de la tarjeta
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título del lugar
                  Text(
                    place.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1, // Limita el título a una línea
                    overflow: TextOverflow
                        .ellipsis, // Añade puntos suspensivos si el texto es demasiado largo
                  ),
                  SizedBox(height: 4),
                  // Descripción del lugar
                  Text(
                    place.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2, // Limita la descripción a dos líneas
                    overflow: TextOverflow
                        .ellipsis, // Añade puntos suspensivos si el texto es demasiado largo
                  ),
                  SizedBox(height: 8),
                  // Rating del lugar
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        place.rating.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
