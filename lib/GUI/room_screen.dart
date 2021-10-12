import 'dart:math';

import 'package:cluphouse_ui/models/room.dart';
import 'package:cluphouse_ui/widgets/room_user_profile.dart';
import 'package:cluphouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  RoomScreen({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        elevation: 0,
        leading: TextButton.icon(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              CupertinoIcons.chevron_down,
              color: Colors.white,
              size: 24,
            ),
            label: const Text(
              ' HallWay',
              style: TextStyle(fontSize: 16, color: Colors.white),
            )),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.doc,
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
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${room.club}🏡'.toUpperCase(),
                      style: Theme.of(context).textTheme.overline!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1,
                          ),
                    ),
                    const Icon(CupertinoIcons.ellipsis),
                  ],
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                ),
              ],
            )),
            SliverGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 20,
              children: room.speakers
                  .map((e) => RoomUserProfile(
                      imageUrl: e.imageURL,
                      name: e.firstName,
                      size: 66,
                      isMuted: Random().nextBool(),
                      isNew: Random().nextBool()))
                  .toList(),
            ),
            SliverToBoxAdapter(
              child: Text(
                '                  Follwed By Speakers',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 4,
              childAspectRatio: .7,
              mainAxisSpacing: 15,
              children: room.followedBySpeakers
                  .map((e) => RoomUserProfile(
                      imageUrl: e.imageURL,
                      name: e.firstName,
                      size: 66,
                      isNew: Random().nextBool()))
                  .toList(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            SliverToBoxAdapter(
              child: Text(
                '                          Others',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 4,
              childAspectRatio: .7,
              mainAxisSpacing: 15,
              children: room.others
                  .map((e) => RoomUserProfile(
                      imageUrl: e.imageURL,
                      name: e.firstName,
                      size: 66,
                      isNew: Random().nextBool()))
                  .toList(),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        height: 90,
        child: Row(
          children: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  '🏵 Leave Quietly',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.w400),
                ),
              style: TextButton.styleFrom(
                padding:const  EdgeInsets.all(8),
               backgroundColor: Colors.grey[400],
               shape:RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20),
               )
              ),
            )
          ],
        ),

      ),
    );
  }
}
