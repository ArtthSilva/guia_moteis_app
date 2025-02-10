import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:guia_moteis_app/data/repositories/motels/motel_repository.dart';
import 'package:guia_moteis_app/domain/entities/motel_entity.dart';

class HomeViewModel extends ChangeNotifier {
  final MotelRepository _motelRepository;

  HomeViewModel(this._motelRepository);

  final ValueNotifier<bool> isLoading = ValueNotifier(true);
final ValueNotifier<List<MotelEntity>> motels = ValueNotifier([]);

Future<void> getAllMotels() async {
  isLoading.value = true;
  try {
    final response = await _motelRepository.getMotels();
    log("Motéis carregados: ${response.length}");
    motels.value = response;
  } catch (e) {
    log("Erro ao carregar motéis: $e");
    motels.value = [];
  } finally {
    isLoading.value = false;
  }
}
}
