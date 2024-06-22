import 'package:appthuan/pages/Chart1.dart';
import 'package:appthuan/pages/Read.dart';
import 'package:appthuan/pages/ReadData.dart';
import 'package:appthuan/pages/home1.dart';

import 'package:appthuan/pages/add_user_page.dart';
import 'package:appthuan/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:appthuan/body/drawer_item.dart';
import 'package:appthuan/pages/people.dart';


class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Color.fromARGB(255, 116, 170, 189),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(height: 20,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 20,),
              DrawerItem(
                name: 'HOME',
                icon: Icons.home,
                onPressed: ()=> onItemPressed(context, index: 0),
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'USERS',
                  icon: Icons.manage_accounts,
                  onPressed: ()=> onItemPressed(context, index: 1)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'GATE1',
                  icon: Icons.wifi,
                  onPressed: ()=> onItemPressed(context, index: 2)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'GATE2',
                  icon: Icons.four_g_mobiledata_outlined,
                  onPressed: ()=> onItemPressed(context, index: 3)
              ),
              const SizedBox(height: 30,),
              const Divider(thickness: 1, height: 10, color: Colors.grey,),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'ALARMS',
                  icon: Icons.notification_important,
                  onPressed: ()=> onItemPressed(context, index: 4)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'DEVICES',
                  icon: Icons.sensors,
                  onPressed: ()=> onItemPressed(context, index: 5)
              ),
              const SizedBox(height: 30,),
              DrawerItem(
                  name: 'REPORT',
                  icon: Icons.report,
                  onPressed: ()=> onItemPressed(context, index: 6)
              ),


            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}){
    Navigator.pop(context);

    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const home1()));
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  People()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const ReadData()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Read()));
        break;
      case 4:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>   HomePage()));
        break;
      case 5:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Chart1()));
        break;
         case 6:
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddUserPage()));
        break;
    }
  }

 

  Widget headerWidget() {
    const url = 'https://i.imgur.com/TWQ1tM0.jpeg';
    return Row(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(url),
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('HUNGNHAN', style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(height: 10,),
            Text('hungnhan@gmail.com', style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );

  }
}



