import 'dart:convert';
import 'package:http/http.dart' as http ;
import 'package:krishicare/models/article_model.dart';


class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async{

    var url = Uri.parse("https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=848bb409a18948bbbc1b8eb0d633685a");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            content: element["content"],
            url: element["url"],
          );
          news.add(articleModel);
        }

      });
    }
  }


}
