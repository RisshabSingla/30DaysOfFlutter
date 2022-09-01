import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);
  final imageURL =
      "https://media-exp1.licdn.com/dms/image/C5603AQHB9cL7q9Lm-g/profile-displayphoto-shrink_100_100/0/1630991914862?e=1667433600&v=beta&t=jLR58rCHLVu02g4A7LYyUIUWWSCB3My7f1PhcZSdxtE";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Risshab Singla"),
                  accountEmail: Text("risshab2singla@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageURL),
                  ),
                )),

            const ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text(
                "Home",
                textScaleFactor: 1.4,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            const ListTile(
              leading: Icon(CupertinoIcons.profile_circled,
                  color: Colors.white),
              title: Text(
                "Profile",
                textScaleFactor: 1.4,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            const ListTile(
              leading: Icon(CupertinoIcons.mail,
                  color: Colors.white),
              title: Text(
                "Email Me",
                textScaleFactor: 1.4,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
