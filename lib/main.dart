import 'package:flutter/material.dart' hide BoxDecoration,BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:StackOver(),
    );
  }
}


class StackOver extends StatefulWidget {
  @override
  _StackOverState createState() => _StackOverState();
}

class _StackOverState extends State<StackOver>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xffF5F5F7),
      appBar: AppBar(
       backgroundColor: Colors.transparent,
       elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your order",style: TextStyle(fontSize: 25.0),),
            SizedBox(height: 20,),
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 8.0,
                    offset: Offset(-7,-7),
                    color: Colors.white,
                    inset: true
                  ),
                  BoxShadow(
                    blurRadius: 8.0,
                    offset: Offset(7,7),
                    color: Color.fromARGB(255, 197, 198, 200),
                    inset: true
                  )
                ]
              ),
              child: TabBar(
                
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.deepOrange,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Past orders',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Ongoing',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget 
                  Center(
                    child: Text(
                      'Past orders',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Ongoing',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}