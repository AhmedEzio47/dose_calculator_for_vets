import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../di/di.dart';

final CollectionReference kDrugsRef =
    di<FirebaseFirestore>().collection('drugs');

final CollectionReference kRoutesRef =
    di<FirebaseFirestore>().collection('routes');

final CollectionReference kSpeciesRef =
    di<FirebaseFirestore>().collection('species');
