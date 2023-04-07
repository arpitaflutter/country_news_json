import 'package:country_news_json/screens/home/model/homeModel.dart';
import 'package:country_news_json/utils/home_helper.dart';
import 'package:flutter/material.dart';

class homeProvider extends ChangeNotifier
{

  String selectedCountry = "in";

  void change(String country)
  {
    selectedCountry = country;
    notifyListeners();
  }

  Future<Welcome> getNews(country)
  async {

    homeHelper h1 = homeHelper();

    var NewsApi = await h1.newsApi(country);
    return NewsApi;

  }
}