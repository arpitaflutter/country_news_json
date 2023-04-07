import 'package:country_news_json/screens/home/view/home_screen.dart';
import 'package:flutter/material.dart';

class tabbar_screen extends StatefulWidget {
  const tabbar_screen({Key? key}) : super(key: key);

  @override
  State<tabbar_screen> createState() => _tabbar_screenState();
}

class _tabbar_screenState extends State<tabbar_screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("24/7 News"),
            centerTitle: false,
            backgroundColor: Colors.grey.shade800,
            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(Icons.menu,color: Colors.white,),
              )
            ],
            bottom: TabBar(
               dividerColor: Colors.white,
              isScrollable: true,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
              indicatorColor: Colors.white,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: "COUNTRY",
                ),
                // Tab(
                //   text: "BUSINESS",
                // ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              home_screen(),
            ],
          ),
        ),
      ),
    );
  }
}
