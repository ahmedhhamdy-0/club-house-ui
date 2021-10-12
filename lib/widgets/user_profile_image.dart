import 'package:flutter/material.dart';

import '../data.dart';
// ignore: must_be_immutable
class ImageProfile extends StatelessWidget {
  String imageUrl;
  double size;
  ImageProfile({Key? key, required this.size,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(size/2-size/10) ,
      child: Image.network(imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}