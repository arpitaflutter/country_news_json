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

    Provider.of<homeProvider>(context,listen: false).getNews;
  }
  @override
  Widget build(BuildContext context) {

    ht = Provider.of<homeProvider>(context,listen: true);
    hf = Provider.of<homeProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
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
                      hf!.change("in");
                    },
                        child: Text("in",style: TextStyle(color: Colors.white,fontSize: 17),)),
                    TextButton(onPressed: () {
                      hf!.change("uk");
                    }, child: Text("uk",style: TextStyle(color: Colors.white,fontSize: 17))),
                    TextButton(onPressed: () {
                      hf!.change("au");
                    }, child: Text("au",style: TextStyle(color: Colors.white,fontSize: 17))),
                    TextButton(onPressed: () {
                      hf!.change("us");
                    }, child: Text("us",style: TextStyle(color: Colors.white,fontSize: 17))),
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
                          return Container(
                            height: 200,width: double.infinity                                                                                                                            ,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(
                                  // mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 13,),
                                    Text("${w1.articles[index].author}",style: TextStyle(color: Colors.white)),
                                    // Text("${w1.articles[index].author}",style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: 130,width: 130,
                                  child: Image.network("${w1.articles[index].url}",fit: BoxFit.cover),
                                ),
                              ],
                            ),
                          );
                        },
                          itemCount: w1!.articles.length,
                        ),
                      );
                    }
                  return CircularProgressIndicator();
                },
                  future: hf!.getNews(ht!.selectedCountry),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
