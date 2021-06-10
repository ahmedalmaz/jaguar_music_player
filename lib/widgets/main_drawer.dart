import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function navHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'Lato', fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: (){},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            alignment: Alignment.centerLeft,
            child: Center(
              child: Text(
                'My Shop !',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.tealAccent),
              ),
            ),
          ),
          buildListTile(
            'Shop',
            Icons.shop,
            () {
              // Navigator.of(context)
              //     .pushReplacementNamed(ProductOverviewScreen.routName);
            },
          ),
          Divider(),
          buildListTile(
            'Orders',
            Icons.payment,
            () {
              // Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            },
          ),
          Divider(),
          buildListTile(
            'Manage Products ',
            Icons.edit,
            () {
              // Navigator.of(context)
              //     .pushReplacementNamed(ProductsScreen.routeName);
            },
          ),
          Divider(),
          buildListTile(
            'Log Out',
            Icons.exit_to_app,
                () {
              // Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed('/');
              // Provider.of<Auth>(context,listen: false).logOut();
              // Navigator.of(context)
              //     .pushReplacementNamed(ProductsScreen.routeName);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
