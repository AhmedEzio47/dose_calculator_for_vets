import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dose_calculator_for_vets/core/failures.dart';
import 'package:dose_calculator_for_vets/core/utils/logger.dart';
import 'package:dose_calculator_for_vets/data/models/drug_model.dart';
import 'package:dose_calculator_for_vets/domain/entities/drug_entity.dart';
import 'package:dose_calculator_for_vets/domain/repositories/drugs_repo.dart';

import '../data_sources/remote/firestore/firestore/firestore_constants.dart';

class DrugsRepoImpl implements DrugsRepo {
  @override
  Future<Either<Failure, List<DrugEntity>>> searchDrugs(String query) async {
    try {
      Query query = kDrugsRef.orderBy('name');

      QuerySnapshot drugsQuery = await query.get();
      List<DrugEntity> routes = drugsQuery.docs
          .map((doc) => DrugModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return Right(routes);
    } catch (ex) {
      Logger.debugLog(ex.toString());
      return Left(ServerFailure());
    }
  }
}