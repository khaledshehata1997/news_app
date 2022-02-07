
import 'package:flutter/material.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'package:provider/provider.dart';
import 'view/view.dart';

void main() {
  runApp(NewsCloud());
}

class NewsCloud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>NewsViewModel())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeView(),

      ),
    );
  }
}
