import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('Assets/Saitama1.png'))),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Look For Quotes'),
            onTap: () => {
              Navigator.of(context).pop()
            },
          ),
          ListTile(
            leading: Icon(Icons.save),
            title: Text('Saved Quotes'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}