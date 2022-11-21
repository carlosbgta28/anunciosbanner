import 'package:anunciosversion/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home:
            home() /*  Scaffold(
          body: Center(
            child: Text('CARLOS  SALAS'),
          ),
        ) */

        );
  }
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  late BannerAd myBanner;
  @override
  void initState() {
    // TODO: implement initState
    //test: ca-app-pub-4336409771912215/8304641094 !! real: ca-app-pub-4906355662100842/4290494647
    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(),
    );
    myBanner.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(
      ad: myBanner,
    );
    final Container adcontainer = Container(
      child: adWidget,
      width: myBanner.size.width.toDouble(),
      height: myBanner.size.height.toDouble(),
    );
    return Scaffold(
      appBar: AppBar(title: Text('carlos anuncios')),
      body: content(adcontainer),
    );
  }
}

Widget content(Widget ads) {
  return Container(
    child: Center(
      child: Container(
        height: 50,
        width: 200,
        child: ads,
      ),
    ),
  );
}
