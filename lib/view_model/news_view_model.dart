import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/model/news_model.dart';
class NewsViewModel extends ChangeNotifier{
  
  getData(String category)async{
    final url=Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=bf86a6d7879e480ea8cbb0fddc8b2e18&category=$category');
    http.Response response=await http.get(url);
    if(response.statusCode==200){
      try{
        return NewsModel.frojson(jsonDecode(response.body));
      }
      catch(e){
        print('Error');
      }
    }
    notifyListeners();

  }
}