import 'package:get_it/get_it.dart';
import 'package:guia_moteis_app/data/repositories/motels/remote_motel_repository.dart';
import 'package:guia_moteis_app/data/services/client_http.dart';
import 'package:guia_moteis_app/data/services/motel/motel_client_http.dart';
import 'package:guia_moteis_app/ui/home/viewmodels/home_viewmodel.dart';
import 'package:http/http.dart';

final getIt = GetIt.instance;

void injector() {
  getIt.registerLazySingleton<ClientHttp>(() => ClientHttp(Client()));
  getIt.registerLazySingleton<MotelClientHttp>(() => MotelClientHttp(getIt<ClientHttp>()));
  getIt.registerLazySingleton<RemoteMotelRepository>(() => RemoteMotelRepository(getIt<MotelClientHttp>()));
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel(getIt<RemoteMotelRepository>()));
}
