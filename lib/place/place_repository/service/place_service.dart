import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turbo/place/place_repository/interface/place_interface.dart';
import 'package:turbo/place/place_repository/models/place/place.dart';

class PlaceService implements PlaceInterface {
  final FirebaseFirestore firestore;

  PlaceService({required this.firestore});

  @override
  Future<List<Place>> getPlaces() async {
    try {
      final snapshot = await firestore.collection('places').get();
      final places = snapshot.docs.map((doc) => doc.data()).toList();
      return places.map((e) => Place.fromJson(e)).toList();
      //TODO implement caching first approach
      /*
      // Guardar los datos en caché local
      await _store.delete(db); // Borrar los datos antiguos
      for (var place in places) {
        await _store.add(db, place);}
        */
    } on FirebaseException catch (e) {
      throw Exception('Failed to load places: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
