import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/app/constant/string_constant.dart';
import 'package:untitled/app/helper/extension_helper.dart';
import 'package:untitled/repository/utills/utills_repository.dart';

class UtillsRepositoryImpl extends UtillsRepository {
  CollectionReference utillsCollection = FirebaseFirestore.instance.collection(AppCollectionConstants.utills);

  @override
  Future<Map<String, dynamic>?>? getUtillsData(String collectionName) async {
    try {
      final DocumentSnapshot snapshot = await utillsCollection.doc(collectionName).get();
      if (snapshot.exists && snapshot.data() != null) {
        return snapshot.data()! as Map<String, dynamic>;
      }
    } on FirebaseException catch (e) {
      'Catch FirebaseException in getUserData --> ${e.message}'.errorLogs();
      e.message?.showError();
    }
    return null;
  }
}
