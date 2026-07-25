import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

    Future<Map<String, dynamic>?> obtenerAlimento(String codigoBarras) async {
        final doc = await _db.collection('alimentos').doc(codigoBarras).get();

            if (!doc.exists) return null;

                return doc.data();
                  }

                    Future<void> guardarAlimento(
                        String codigo,
                            Map<String, dynamic> datos,
                              ) async {
                                  await _db.collection('alimentos').doc(codigo).set(datos);
                                    }
                                    }