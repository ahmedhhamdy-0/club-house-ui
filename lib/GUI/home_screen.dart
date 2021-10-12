import 'package:cluphouse_ui/data.dart';
import 'package:cluphouse_ui/widgets/home_appbar.dart';
import 'package:cluphouse_ui/widgets/room_card.dart';
import 'package:cluphouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MakeAppBar(),
        body: Stack(
          alignment: Alignment.center,
          children: [
            ListView(
              padding: const EdgeInsets.all(16),
              children: [...roomLists.map((e) => RoomCard(room: e))],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Theme.of(context).scaffoldBackgroundColor.withOpacity(.6),
                      Theme.of(context).scaffoldBackgroundColor,
                    ])),
              ),
            ),
            Positioned(
              bottom: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.add),
                label: const Text(
                  'Start a room',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding:const EdgeInsets.all(12),
                  primary: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
              ),
            )
          ],
        ));
  }
}
