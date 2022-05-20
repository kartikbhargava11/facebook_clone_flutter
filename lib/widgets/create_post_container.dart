import 'package:flutter/material.dart';

import './profile_avatar.dart';
import './responsive.dart';

import '../models/user.dart';


class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    required this.currentUser,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: isDesktop ? 5.0 : 0.0
      ),
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop ? RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ) : null,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDesktop ? BorderRadius.circular(10.0) : null
        ),
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8.0),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: "What's on your mind ?",
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10.0,
              thickness: 0.5,
            ),
            SizedBox(
              height: 40.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: const Text(
                      "Live",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                  ),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.green,
                      ),
                      label: const Text(
                        "Photo",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                  ),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.video_call,
                        color: Colors.purple,
                      ),
                      label: const Text(
                        "Room",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
