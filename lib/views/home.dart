import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/models/categorymodel.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/helper/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/category_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool _loading = true;
  @override
  void initState() {
    categories = getCategories();
    super.initState();
    getNewss();
  }

  getNewss() async {
    News newss = News();
    await newss.getNews();
    articles = newss.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 8,
            backgroundColor: Colors.black,
            title: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.electric_bolt_sharp),
                  SizedBox(width: 2),
                  Text(
                    'Flash',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'News',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          body: _loading
              ? Center(child: Container(child: CircularProgressIndicator()))

              ///Categories
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                imageUrl: categories[index].imageUrl,
                                categoryname: categories[index].categoryname,
                              );
                            },
                          ),
                        ),
                      ),

                      ///Blogs / News Tiles
                      Expanded(
                        flex: 7,
                        child: Container(
                          padding: EdgeInsets.only(top: 8),
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: articles.length,
                            itemBuilder: (context, index) {
                              return NewsTile(
                                title: articles[index].title,
                                imageUrl: articles[index].urlToImage,
                                desc: articles[index].description,
                                url: articles[index].url,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryname;
  CategoryTile({required this.imageUrl, required this.categoryname});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNews(type: categoryname.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26),
              child: Center(
                child: Text(
                  categoryname,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String title, imageUrl, desc, url;
  NewsTile(
      {required this.title,
      required this.imageUrl,
      required this.desc,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleView(newsUrl: url)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(imageUrl),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.black54),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: LinearProgressIndicator(
                value: 100,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
