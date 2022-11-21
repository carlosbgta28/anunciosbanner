import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class homeScreen extends StatefulWidget {
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  //ads
  late BannerAd staticAd;

  bool staticAdLoaded = false;

  static const AdRequest request = AdRequest(

      //keywords: ['',''],
      //contentUrl: '',
      //nonPersonalizedAds: false
      );

  void loadStaticBannerAd() {
    staticAd = BannerAd(
        adUnitId: //test: ca-app-pub-4336409771912215/8304641094 || real: ca-app-pub-4336409771912215/1019860019

            'ca-app-pub-4336409771912215/8304641094',
        size: AdSize.banner,
        request: request,
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            staticAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('ad failed to load ${error.message}');
        }));

    staticAd.load();
  }

  @override
  void initState() {
    // TODO: implement initState
    loadStaticBannerAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hola carlos'),
      ),

      //ad banner bottom screen
      bottomNavigationBar: Container(
        height: 60,
        child: Center(
          child: Column(
            children: [
              Container(
                //load de ad and give size
                child: AdWidget(
                  ad: staticAd,
                ),
                width: staticAd.size.width.toDouble(),
                height: staticAd.size.height.toDouble(),
                alignment: Alignment.bottomCenter,
              )
            ],
          ),
        ),
      ),
    );
  }
}
