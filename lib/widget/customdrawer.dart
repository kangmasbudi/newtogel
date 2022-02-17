import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screen/dashboard.dart';
import 'package:flutter_social_ui/screen/profil.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key key}) : super(key: key);

  _buildOptiondrawer(Icon icon, String title, Function ontap) {
    return ListTile(
      leading: icon,
      onTap: ontap,
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
                image: AssetImage(currentUser.backgroundImageUrl),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      "Selamat Datang \nSobat Togel",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontStyle: FontStyle.italic,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
          ListView(
            children: <Widget>[
              ExpansionTile(
                title: Text("Expansion Title"),
                children: <Widget>[Text("children 1"), Text("children 2")],
              )
            ],
          ),
          _buildOptiondrawer(
              Icon(Icons.home),
              "Home",
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()))),
          _buildOptiondrawer(
              Icon(Icons.home),
              "Data Result",
              () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Dashboard()))),
          Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: _buildOptiondrawer(
                    Icon(Icons.dashboard),
                    "Profile",
                    () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profil(
                                  user: currentUser,
                                ))))),
          )
        ],
      ),
    );
  }
}
