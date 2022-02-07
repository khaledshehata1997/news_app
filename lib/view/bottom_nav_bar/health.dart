import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/view_model/news_view_model.dart';
import 'package:provider/provider.dart';
class Health extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<NewsViewModel>(context);
    return  FutureBuilder(
      future:provider.getData('health') ,
      builder: (context , AsyncSnapshot snapShot){
        NewsModel? data=snapShot.data;
        if(snapShot.hasData){
          return ListView.builder(
              itemCount: data!.articles!.length,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    Container(
                      height:200 ,
                      width: double.infinity,
                      child: Image.network(data.articles![index].urlToImage.toString(),fit: BoxFit.fill,),
                    ),
                    Text(data.articles![index].title.toString(),style: TextStyle(
                        fontSize: 20,fontWeight: FontWeight.bold
                    ),
                      textDirection: TextDirection.rtl,)
                    ,
                    Text(data.articles![index].title.toString(),style: TextStyle(
                        fontSize: 15,color: Colors.grey
                    ),
                      textDirection: TextDirection.rtl,)
                  ],
                );
              }
          );
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
