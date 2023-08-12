import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://e0.pxfuel.com/wallpapers/1009/445/desktop-wallpaper-thor-movie-wide-poster-best.jpg',
  'https://wallpapersmug.com/download/2560x1440/6e645c/captain-marvel-movie-poster.jpg',
  'https://picstatio.com/large/317636/Jumanji-Welcome-to-the-Jungle-wide.jpg',
  'https://w0.peakpx.com/wallpaper/505/770/HD-wallpaper-1917-2019-poster-promo-george-mackay-war-film-promotional-materials.jpg',
  'https://www.tallengestore.com/cdn/shop/products/Midway_2019_-_Hollywood_War_WW2_Original_Movie_Poster_f261718e-611c-4143-9a6c-9db2fa9bdf4d.jpg?v=1582782916',
  'https://cdn.wallpapersafari.com/76/85/fFsbXB.jpg'
];

class CarouselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ComplicatedImageDemo();
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            color: Colors.red,
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                child: Stack(
              children: <Widget>[
                Image.network(
                  item,
                  fit: BoxFit.cover,
                  height: 900,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Text(
                      'No. ${imgList.indexOf(item)} image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    child: Center(
                  child: Icon(
                    Icons.play_circle_outline,
                    size: 50,
                    color: Color.fromARGB(255, 235, 216, 46),
                  ),
                ))
              ],
            )),
          ),
        ))
    .toList();

class ComplicatedImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double itemHeight = MediaQuery.of(context).size.height / 3;
    final double itemWidth = MediaQuery.of(context).size.width;
    final double aspectRatio = itemWidth / itemHeight;

    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: aspectRatio,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
