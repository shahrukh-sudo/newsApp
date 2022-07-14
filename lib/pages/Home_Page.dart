import 'package:cv_project/auth_service.dart';
import 'package:cv_project/backend/apiFunctions.dart';
import 'package:cv_project/components/newsBox.dart';

import 'package:cv_project/components/searchbar.dart';
import 'package:cv_project/utils/colors.dart';
import 'package:cv_project/utils/constants.dart';
import 'package:cv_project/utils/text.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List> news;

  @override
  void initState() {
    super.initState();
    news = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              AuthService().signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
        backgroundColor: AppColors.black,
        elevation: 0,
        title: Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                boldText(text: 'Tech', size: 20, color: AppColors.primary),
                modifiedText(
                    text: 'Newz', size: 20, color: AppColors.lightWhite),
              ],
            )),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: Container(
              width: w,
              child: FutureBuilder<List>(
                future: fetchNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return NewsBox(
                            url: snapshot.data![index]['url'],

                            imageurl:
                                snapshot.data![index]['urlToImage']  != null
                                    ? snapshot.data![index]['urlToImage']
                                    : Constants.imageUrl,
                            title: snapshot.data![index]['title'],
                            time: snapshot.data![index]['publishedAt'],
                            description: snapshot.data![index]['discription'].toString(),
                          );
                        });
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error} hi");
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ) ,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
