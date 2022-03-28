// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kherokhata/login.dart';
import 'package:kherokhata/profileedit.dart';

import 'package:kherokhata/globals.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String uid;
  late User userdata;

  @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
    userdata = FirebaseAuth.instance.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text('খেরোখাতা'),
        flexibleSpace: appBarStyle(),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (route) => false);
            },
          )
        ],
      ),
      drawer: _homeDrawer(),
      body: Center(
        child: Text(userdata.displayName!),
      ),
    );
  }

  Widget _homeDrawer() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image.asset("assets/images/drawer.jpg"),
            Positioned(
              left: 30,
              bottom: 70,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  boxShadow: [_boxShadow1()],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text("A", style: TextStyle(fontSize: 25)),
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(50.0),
                //   child: Image.asset("assets/images/withouttext.png"),
                // ),
              ),
            ),
            Positioned(
              left: 30,
              bottom: 40,
              child: Text('দোকানের নাম',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            Positioned(
              left: 30,
              bottom: 25,
              child: Text('ইউজারনেম',
                  style: TextStyle(color: Colors.white70, fontSize: 13)),
            ),
            Positioned(
              right: 10,
              bottom: 30,
              child: IconButton(
                padding: EdgeInsets.all(0.0),
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfileEditPage()));
                },
              ),
            ),
            Positioned(
              right: 3,
              bottom: 3,
              child: Text("Version: 1.0.0",
                  style: TextStyle(color: Colors.white60, fontSize: 11)),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.black87,
          ),
          title: Text("নীড়"),
          onTap: () {
            Navigator.pop(context); // this line closes the drawer
          },
        ),
        // ListTile(
        //   leading: Icon(
        //     Icons.add_to_photos,
        //     color: Colors.black87,
        //   ),
        //   title: Text("প্রশ্ন যোগ করুন"),
        //   onTap: () {
        //     Navigator.pop(context);
        //     // Route route = MaterialPageRoute(builder: (context) => NotificationPage(["1", "2"]));
        //     // Navigator.push(context, route);
        //     Navigator.pushNamed(context, '/formpage');
        //   },
        // ),
        // ListTile(
        //   leading: Icon(
        //     Icons.favorite,
        //     color: Colors.black87,
        //   ),
        //   title: Text("প্রিয় তালিকা"),
        //   onTap: () {
        //     Navigator.pop(context);
        //     // Route route = MaterialPageRoute(builder: (context) => NotificationPage(["1", "2"]));
        //     // Navigator.push(context, route);
        //     Navigator.pushNamed(context, '/favorites');
        //   },
        // ),
        // Divider(
        //   color: Colors.black26,
        // ),
        // ListTile(
        //   leading: Icon(
        //     Icons.settings,
        //     color: Colors.black87,
        //   ),
        //   title: Text("সেটিংস"),
        //   onTap: () {
        //     Navigator.pop(context);
        //     Route route =
        //         MaterialPageRoute(builder: (context) => SettingsPage());
        //     Navigator.push(context, route).then((value) {
        //       setState(() {
        //         userName = value[0];
        //         userDesig = value[1];
        //         userOrg = value[2];
        //       });
        //     });
        //   },
        // ),
        // ListTile(
        //   leading: Icon(
        //     Icons.mail,
        //     color: Colors.black87,
        //   ),
        //   title: Text("মতামত জানান"),
        //   onTap: () {
        //     Navigator.pop(context);
        //     Route route =
        //         MaterialPageRoute(builder: (context) => ContactPage(userName));
        //     Navigator.push(context, route);
        //   },
        // ),
        // ListTile(
        //   leading: Icon(
        //     Icons.info,
        //     color: Colors.black87,
        //   ),
        //   title: Text("আমাদের সম্পর্কে"),
        //   onTap: () {
        //     Navigator.pop(context);
        //     _showDialog();
        //   },
        // ),
        // ListTile(
        //   leading: Icon(
        //     Icons.share,
        //     color: Colors.black87,
        //   ),
        //   title: Text("শেয়ার করুন"),
        //   onTap: () {
        //     Navigator.pop(context);
        //     share();
        //     // final RenderBox box = context.findRenderObject();
        //     // Share.share("https://orbachinujbuk.com/",
        //     //   subject: "অ্যাপটি শেয়ার করুন!",
        //     //   sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size
        //     // );
        //     // Share.share('check out my website https://example.com', subject: 'Look what I made!');
        //   },
        // ),
        Divider(
          color: Colors.black26,
        ),
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Colors.black87,
          ),
          title: Text("লগ আউট"),
          onTap: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          },
        ),
      ],
    ));
  }

  BoxShadow _boxShadow1() {
    return BoxShadow(
      color: Colors.grey[700]!,
      blurRadius: 10.0, // has the effect of softening the shadow
      spreadRadius: 1.0, // has the effect of extending the shadow
      offset: Offset(
        3.0, // horizontal, move right 10
        3.0, // vertical, move down 10
      ),
    );
  }
}
