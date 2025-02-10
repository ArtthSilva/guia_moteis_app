
import 'package:flutter/material.dart';
import 'package:guia_moteis_app/config/dependencies.dart';
import 'package:guia_moteis_app/ui/home/home_page.dart';
 
void main() {
  injector();
runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));}