import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Curie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var items = [
      "assets/curie_images/curie-1.jpg",
      "assets/curie_images/curie-2.jpg",
      "assets/curie_images/curie-3.jpg",
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Marie Curie",
          style: GoogleFonts.zcoolKuaiLe(),
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        Lottie.asset("assets/lottie_animations/curie.json",
            animate: true, repeat: true, height: size.height * 0.4),
        RichText(
            text: TextSpan(
                text: 'Marie Curie',
                style: GoogleFonts.zcoolKuaiLe(
                    decoration: TextDecoration.underline,
                    color: Colors.amber,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    String url = "https://en.wikipedia.org/wiki/Marie_Curie";
                    var urllaunchable = await canLaunch(url);
                    if (urllaunchable) {
                      await launch(url);
                    } else {
                      print("URL can't be launched.");
                    }
                  },
                children: [
              TextSpan(
                  text:
                      " 7 November 1867 – 4 July 1934) was a Polish and naturalized-French physicist and chemist who conducted pioneering research on radioactivity. "
                      "She was the first woman to win a Nobel Prize, the first person and the only woman to win the Nobel Prize twice, and the only person to win the Nobel Prize in two scientific fields. Her husband, Pierre Curie, was a co-winner on her first Nobel Prize, making them the first ever married couple to win the Nobel Prize and launching the Curie family legacy of five Nobel Prizes. "
                      "She was, in 1906, the first woman to become a professor at the University of Paris.",
                  style: GoogleFonts.zcoolKuaiLe(
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none))
            ])),
        SizedBox(height: size.height * 0.02),
        CarouselSlider.builder(
            itemCount: items.length,
            itemBuilder: (context, itemIndex, realIndex) {
              return Container(
                  height: size.height * 0.3,
                  margin: EdgeInsets.all(4),
                  child: Image(
                    image: AssetImage(items[itemIndex]),
                  ));
            },
            options: CarouselOptions(
                autoPlay: true,
                height: size.height * 0.3,
                viewportFraction: 1)),
      ]),
    );
  }
}
