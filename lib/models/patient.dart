import 'package:flutter/material.dart';

class Patient {
  final String id;
  final String firstName;
  final String lastName;
   int hertBeat;
   String imageUrl;

  

    Patient({
    @required this.id,
    @required this.firstName,
    @required this.lastName,
    this.hertBeat,
    this.imageUrl,


  });
}
