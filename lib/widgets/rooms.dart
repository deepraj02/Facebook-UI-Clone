import 'package:facebook_clone_ui/config/palette.dart';
import 'package:facebook_clone_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class Room extends StatelessWidget {
  final List<User> onlineUsers;

  const Room({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: _createRoomButton(),
              );
            }
            final User user = onlineUsers[index - 1];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          }),
    );
  }
}

class _createRoomButton extends StatelessWidget {
  const _createRoomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: () => print("Room"),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      color: Colors.white,
      borderSide: BorderSide(
        width: 3,
        color: Colors.blueAccent,
      ),
      textColor: Palette.facebookBlue,
      child: Row(children: [
        ShaderMask(
          shaderCallback: (rect) =>
              Palette.createRoomGradient.createShader(rect),
          child: Icon(
            Icons.video_call,
            size: 35,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text("Create\nRoom")
      ]),
    );
  }
}
