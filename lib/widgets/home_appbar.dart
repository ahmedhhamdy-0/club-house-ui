import 'package:cluphouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

// ignore: non_constant_identifier_names
AppBar MakeAppBar(){
  return AppBar(
    // title: Text('hello world'),
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.search,
        size: 28,
      ),
      onPressed: () {},
    ),
    actions: [
      IconButton(
        icon: const Icon(
          CupertinoIcons.envelope_open,
          size: 28,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          CupertinoIcons.calendar,
          size: 28,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: const Icon(
          CupertinoIcons.bell,
          size: 28,
        ),
        onPressed: () {},
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
            onTap: () {},
            child: ImageProfile(
              size: 34,
              imageUrl: currentUser.imageURL,
            )),
      ),
    ],
  );
}
