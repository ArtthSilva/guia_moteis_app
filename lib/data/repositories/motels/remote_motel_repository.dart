 
import 'package:guia_moteis_app/data/repositories/motels/motel_repository.dart';
import 'package:guia_moteis_app/data/services/motel/motel_client_http.dart';
import 'package:guia_moteis_app/domain/entities/motel_entity.dart';

class RemoteMotelRepository implements MotelRepository{
    RemoteMotelRepository(this._authClientHttp);
    
    final MotelClientHttp _authClientHttp;

  @override
  Future<List<MotelEntity>> getMotels() async {
    final result = await _authClientHttp.getMotels();
    return result.fold(
      (success) => success,  
      (failure) => throw failure,  
    );
  }
}