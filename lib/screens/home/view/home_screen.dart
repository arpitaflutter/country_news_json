import 'package:country_news_json/screens/home/model/homeModel.dart';
import 'package:country_news_json/screens/home/provider/homeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  homeProvider? ht,hf;
  Welcome? w1;

  @override
  void initState() {
    super.initState();

    Provider.of<homeProvider>(context,listen: false).getNews("in");
  }
  @override
  Widget build(BuildContext context) {

    ht = Provider.of<homeProvider>(context,listen: true);
    hf = Provider.of<homeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Country News"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(onPressed: () {
                       ht!.getNews("in");
                    }, child: Text("in")),
                    TextButton(onPressed: () {
                      ht!.getNews("uk");
                    }, child: Text("uk")),
                    TextButton(onPressed: () {
                      ht!.getNews("au");
                    }, child: Text("au")),
                    TextButton(onPressed: () {
                      ht!.getNews("us");
                    }, child: Text("us")),
                  ],
                ),
                FutureBuilder(builder: (context, snapshot) {

                  if(snapshot.hasError)
                    {
                      return Text("${snapshot.error}");
                    }
                  else if(snapshot.hasData)
                    {
                      Welcome? w1 = snapshot.data;

                      return Expanded(
                        child: ListView.builder(itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("${w1.totalResults}"),
                            subtitle: Text("${w1.articles[index].author}"),
                          );
                        },
                          itemCount: w1!.articles.length,
                        ),
                      );
                    }

                  return CircularProgressIndicator();
                },
                  future: ht!.getNews("in"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
