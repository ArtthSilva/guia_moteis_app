 
import 'package:guia_moteis_app/domain/entities/motel_entity.dart';

abstract interface class MotelRepository {
  Future<List<MotelEntity>> getMotels(); 
}