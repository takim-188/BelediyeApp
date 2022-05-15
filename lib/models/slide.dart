import 'package:flutter/material.dart';

class Slide {
        //final String imageUrl;
        final String title;
        final String description;

  Slide({
        //required this.imageUrl,
        required this.title,
        required this.description});
}

final slideList = [
  Slide(
        //imageUrl: 'images/etkinlik.jpg',
        title: 'Hoş geldin!',
        description: '',
  ),
  Slide(
        //imageUrl: 'images/haber.jpg',
        title: '',
        description: 'Güncel haberler',
  ),
  Slide(
        title: '',
        description: 'Etkinlikler',
  ),
];