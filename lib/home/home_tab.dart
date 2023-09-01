import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/home/latest/latest_widget.dart';
import 'package:movie_app/home/popular_now/PopularNow.dart';
import 'package:movie_app/home/popular_now/popular_widget.dart';
import 'package:movie_app/home/top_rated/TopRatedMovies.dart';
import 'package:movie_app/home/top_rated/top_rated_widget.dart';

import '../api/api_manager.dart';

class HomeTab extends StatefulWidget {
  static const String RouteName = 'homeTab';

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FutureBuilder<PopularNow>(
              future: ApiManager.getPopularNow(),
              builder: (buildcontext, snapShot) {
                if (snapShot.hasError) {
                  return Center(child: Text(snapShot.error.toString()));
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapShot.data;
                if ('false' == data?.success) {
                  return Center(child: Text('${data?.statusMessage}'));
                }
                return CarouselSlider(
                  items: snapShot.data!.resultsList!.map((element) {
                    //by5od result wa7da mn rl list of result y3ny

                    return PopularWidget(
                        element); // converts from list to elemnt of list
                  }).toList(),
                  options: CarouselOptions(
                    height: size.height * 0.33,
                    initialPage: 0,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 400),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              },
            ),
            FutureBuilder<PopularNow>(
              future: ApiManager.getPopularNow(),
              builder: (buildcontext, snapShot) {
                if (snapShot.hasError) {
                  return Center(child: Text(snapShot.error.toString()));
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapShot.data;
                if ('false' == data?.success) {
                  return Center(child: Text('${data?.statusMessage}'));
                }
                return CarouselSlider(
                  items: snapShot.data!.resultsList!.map((element) {
                    return LatestWidget(element);
                  }).toList(),
                  options: CarouselOptions(
                    height: size.height * 0.33,
                    initialPage: 0,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 400),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              },
            ),
            FutureBuilder<TopRatedMovies>(
              future: ApiManager.getTopRated(),
              builder: (buildcontext, snapShot) {
                if (snapShot.hasError) {
                  return Center(child: Text(snapShot.error.toString()));
                } else if (snapShot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapShot.data;
                if ('false' == data?.success) {
                  return Center(child: Text('${data?.statusMessage}'));
                }
                return CarouselSlider(
                  items: snapShot.data!.resultsTopRated!.map((element) {
                    return TopRatedWidget(element);
                  }).toList(),
                  options: CarouselOptions(
                    height: size.height * 0.34,
                    initialPage: 0,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 400),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
