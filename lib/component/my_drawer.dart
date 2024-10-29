import 'package:flutter/material.dart';
import 'package:ukk_kasir/Component/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("MM.png"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(25),
            child: Divider(
              color: Colors.black,
            ),
          ),
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {},
          ),
          MyDrawerTile(
            text: "P R O F I L E",
            icon: Icons.person,
            onTap: () {},
          ),
          const Spacer(),
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout,
            onTap: () => Navigator.pushNamed(context, '/loginhome'),
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
