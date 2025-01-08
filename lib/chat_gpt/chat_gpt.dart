import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  void openDrawer() {
    setState(() {
      xOffset = 230;
      yOffset = 100;
      scaleFactor = 0.85;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: Stack(
        children: [
          // Drawer Menu
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 20, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Menu",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(height: 20),
                  drawerItem(Icons.home, "Home"),
                  drawerItem(Icons.person, "Profile"),
                  drawerItem(Icons.location_on, "Nearby"),
                  drawerItem(Icons.bookmark, "Bookmark"),
                  drawerItem(Icons.notifications, "Notification"),
                  drawerItem(Icons.message, "Message"),
                  Spacer(),
                  drawerItem(Icons.settings, "Setting"),
                  drawerItem(Icons.help, "Help"),
                  drawerItem(Icons.logout, "Logout"),
                ],
              ),
            ),
          ),

          // Main Content with Animation
          AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor),
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: isDrawerOpen ? BorderRadius.circular(30) : BorderRadius.zero,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 30 : 0),
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(isDrawerOpen ? Icons.arrow_back : Icons.menu,
                        color: Colors.black),
                    onPressed: () {
                      if (isDrawerOpen) {
                        closeDrawer();
                      } else {
                        openDrawer();
                      }
                    },
                  ),
                  title: Text("Jakarta", style: TextStyle(color: Colors.black)),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search address, etc.",
                            filled: true,
                            fillColor: Colors.grey[200],
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      // Example Card UI
                      Container(
                        margin: EdgeInsets.all(16),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://source.unsplash.com/600x400/?house'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ],
      ),
    );
  }
}
