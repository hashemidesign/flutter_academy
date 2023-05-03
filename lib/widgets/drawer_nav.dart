import 'package:flutter/material.dart';

class DrawerNav extends StatelessWidget {
  const DrawerNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Flutter Academy",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/'),
            title: const Text("Home"),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/courses'),
            title: const Text("Courses"),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/about'),
            title: const Text("About"),
          ),
          ListTile(
            onTap: () => Navigator.pushNamed(context, '/contact'),
            title: const Text("Contact"),
          ),
        ],
      ),
    );
  }
}
