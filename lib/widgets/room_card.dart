// ignore_for_file: must_be_immutable

import 'package:cluphouse_ui/GUI/room_screen.dart';
import 'package:cluphouse_ui/models/room.dart';
import 'package:cluphouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  Room room;

  RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: GestureDetector(
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (_) =>  RoomScreen(room:room))),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '${room.club}  🏡'.toUpperCase(),
                    style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                        ),
                  ),
                  Text(
                    '${room.name}  🏡'.toUpperCase(),
                    style: Theme.of(context).textTheme.overline!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 100,
                          child: Stack(
                            children: [
                              Positioned(
                                  left: 26,
                                  top: 24,
                                  child: ImageProfile(
                                      size: 48,
                                      imageUrl: room.speakers[0].imageURL)),
                              ImageProfile(
                                  size: 48, imageUrl: room.speakers[1].imageURL)
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...room.speakers.map((e) => Text(
                                    '${e.firstName} ${e.lastName}💛',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(fontSize: 16),
                                  )),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text:
                                          '${room.speakers.length + room.followedBySpeakers.length + room.others.length} '),
                                  const WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 18,
                                    color: Colors.grey,
                                  )),
                                  TextSpan(text: ' / ${room.speakers.length} '),
                                  const WidgetSpan(
                                      child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    size: 18,
                                    color: Colors.grey,
                                  ))
                                ]),
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
