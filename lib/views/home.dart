import 'package:flutter/material.dart';
import 'package:krishicare/helper/data.dart';
import 'package:krishicare/helper/news.dart';
import 'package:krishicare/models/CategorieModel.dart';
import 'package:krishicare/models/article_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override


  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }
  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
        Text("News ", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),),
          Text("Cart", style: TextStyle(color: Colors.brown, fontWeight: FontWeight.w600),
          )
        ],
        ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
    ),
    body:_loading ? Center(
      child: Container(
        child: CircularProgressIndicator(),
      ),
    ):SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(

              elevation: 40,
              child: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text("Categories", style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
                ),
              ),
            ),
          ),

            ///Categories
            Container(
              height: 180,
              child: ListView.builder(itemCount: categories.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return CategoryTile(
                  imageUrl: categories[index].imageUrl,
                  categoryName: categories[index].categoryName,
                );
              },
              ),
            ),
            const Card(
              elevation: 40,
              child: Padding(
                padding: EdgeInsets.all( 8.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text("Top News", style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
                ),
              ),
            ),
            ///Blogs
            Card(
              elevation: 100,
              shadowColor: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: ListView.builder(
                  itemCount: articles.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index) {
                    return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description
                    );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
    ),
    );
  }
}

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile({this.imageUrl,this.categoryName});

  @override
  Widget build(BuildContext context) {
    return
    Container(
        margin: EdgeInsets.only(right: 14),
    child: Stack(
    children: <Widget>[
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          imageUrl, height: 180, width: 360, fit: BoxFit.cover,
        ),
      ),
      Container(
        alignment: Alignment.center, height: 180, width: 360,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black26
        ),
        child: Text(
          categoryName,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      )
    ],
    ),
      );
  }
}

class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc;
  BlogTile({required this.imageUrl, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 8),
      child: Card(
        elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                  child: Image.network( imageUrl,fit: BoxFit.cover,)),
              SizedBox(height: 8,),

              Text(title,style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87
              ),),
              SizedBox(height: 8,),
              Text(desc,style: const TextStyle(
                fontSize: 14,
                color: Colors.black54
              ),)
            ],
          ),
      ),
    );
  }
}


