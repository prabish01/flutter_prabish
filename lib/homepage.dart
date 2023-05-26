import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/Cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:remixicon/remixicon.dart';
import 'loginPage.dart';
import 'homepage.dart';
import 'tapPage.dart';

class homepage extends StatefulWidget {
  final String esewaName;
  // final double balance;

  const homepage({
    super.key,
    required this.esewaName,
  });

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  double balance = 0.0;
  final _name = TextEditingController();
  final controller = CarouselController();
  final urlImages = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfQqXc6GdaBGEqx5MUd_hGsGsgcA8tbg-dxg&usqp=CAU',
    'https://cdn.esewa.com.np/ui/images/slider/OG9tVafOtzRhY1A3ghiEMPIN%20slider.jpg',
    'data:image/jpeg;base64,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',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQI8niqCajqBvlJ4Psg1QaPx58uB6aCY9GRTg&usqp=CAU',
    'assets/images/5.jpg',
  ];

  int activeIndex = 0;
  int currentTab = 0;
  bool isviewmore = false;

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = homepage(
      esewaName: widget.esewaName,
      // balance: widget.balance,
    );
    return SafeArea(
      child: new Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 140, 217, 129),
          foregroundColor: Color.fromARGB(255, 38, 38, 38),
          onPressed: () {},
          child: Icon(Icons.qr_code),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 38, 38, 38),
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MaterialButton(
                        onPressed: () {},
                        minWidth: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.home)],
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/photo.png'),
            ),
          ),
          title: Text("${widget.esewaName}"),
          actions: [
            Icon(
              Icons.search,
              size: 30,
            ),
            Icon(
              Icons.notifications,
              size: 30,
            ),
            PopupMenuButton(
                icon: Icon(
                  Icons.more_vert_rounded,
                  size: 30,
                ),
                itemBuilder: (context) => [])
          ],
          elevation: 0,
          toolbarHeight: 70,
          backgroundColor: Color.fromARGB(255, 38, 38, 38),
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80),
                            bottomRight: Radius.circular(80)),
                        color: Color.fromARGB(255, 38, 38, 38)),
                    height: 100,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 15),
                  child: Container(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            new Container(
                              decoration: BoxDecoration(
                                  // color: const Color(0xFFfcfcfc),
                                  borderRadius: BorderRadius.circular(15)),
                              child: new Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    new Container(
                                      // color: const Color(0xFFb328c6),
                                      padding: const EdgeInsets.all(0.0),
                                      alignment: Alignment.center,
                                      width: 170,
                                      height: 50,
                                      child: Container(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              25, 0, 0, 0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                size: 20,
                                                Icons
                                                    .account_balance_wallet_outlined,
                                                color: Color.fromARGB(
                                                    255, 140, 217, 129),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "Balance",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                          fontFamily: 'Arial'),
                                                    ),
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      "Balance",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                          fontFamily: 'Arial'),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    new Container(
                                      // color: const Color(0xFF84b68d),
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 0, 0, 0),
                                      alignment: Alignment.center,
                                      width: 170,
                                      height: 50,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            25, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons.award,
                                                size: 20,
                                                color: Color.fromARGB(
                                                    255, 140, 217, 129)),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Balance",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontFamily: 'Arial'),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "Balance",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.white,
                                                        fontFamily: 'Arial'),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ]),
                              alignment: Alignment.topCenter,
                              width: 300.0,
                              height: 50.0,
                            ),
                            new Container(
                              // color: const Color(0xFF5389dc),
                              // padding: const EdgeInsets.all(0.0),
                              alignment: Alignment.center,
                              width: 300.0,
                              height: 90.0,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: GridView.builder(
                                    itemCount: 4,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            crossAxisSpacing: 25,
                                            mainAxisSpacing: 25),
                                    itemBuilder: (context, index) {
                                      List children = [
                                        gridIcon(
                                          title: 'Load\nMoney',
                                          icon: Icons
                                              .account_balance_wallet_outlined,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        tapPage(
                                                          esewaName: _name.text,
                                                        )));
                                          },
                                        ),
                                        gridIcon(
                                          title: 'Send\nMoney',
                                          icon: Icons
                                              .account_balance_wallet_rounded,
                                          onTap: () {},
                                        ),
                                        gridIcon(
                                          title: 'Bank\nTransfer',
                                          icon: FontAwesomeIcons.bank,
                                          onTap: () {},
                                        ),
                                        gridIcon(
                                          title: 'Remmittance',
                                          icon: FontAwesomeIcons
                                              .moneyBillTransfer,
                                          onTap: () {},
                                        ),
                                      ];

                                      if (index >= children.length) {
                                        return Container();
                                      }

                                      return children[index];
                                    }),
                              ),
                            )
                          ]),
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black,
                              Color.fromARGB(255, 29, 29, 29),
                            ],
                            stops: [
                              0.34,
                              0.34
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 15),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: GridView.builder(
                      itemCount: 23,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 25),
                      itemBuilder: (context, index) {
                        List children = [
                          gridIcon(
                            title: 'Topup',
                            icon: FontAwesomeIcons.mobileScreen,
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => tapPage()),
                              // );
                            },
                          ),
                          gridIcon(
                            title: 'Electricity',
                            icon: FontAwesomeIcons.lightbulb,
                            onTap: () {},
                            // iconsize: 3,
                            // clr: Colors.blue
                          ),
                          gridIcon(
                            title: 'Khanepani',
                            // iconsize: 3,
                            icon: FontAwesomeIcons.faucetDrip,
                            onTap: () {},
                            // clr: Colors.red
                          ),
                          gridIcon(
                            title: 'eSewa Care',
                            icon: FontAwesomeIcons.handsHoldingChild,
                            onTap: () {
                              print("kam garooo");
                            },
                          ),
                          gridIcon(
                            title: 'Request\nmoeny',
                            icon: FontAwesomeIcons.handHoldingDollar,
                            onTap: () {
                              print("hello working aba");
                            },
                          ),
                          gridIcon(
                            title: 'Internet',
                            icon: FontAwesomeIcons.wifi,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Airlines',
                            icon: FontAwesomeIcons.planeDeparture,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'International\nAirlines',
                            icon: FontAwesomeIcons.globeAfrica,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Hotels',
                            icon: FontAwesomeIcons.city,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Govt.\nPayment',
                            icon: FontAwesomeIcons.schoolFlag,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Cable Car',
                            icon: FontAwesomeIcons.cableCar,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Sahakari\nDeposit',
                            icon: FontAwesomeIcons.shop,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Television',
                            icon: FontAwesomeIcons.tv,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Education\nFee',
                            icon: FontAwesomeIcons.graduationCap,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Insurance',
                            icon: FontAwesomeIcons.umbrella,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Financial\nService',
                            icon: FontAwesomeIcons.piggyBank,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Health',
                            icon: FontAwesomeIcons.circlePlus,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Bus Ticket',
                            icon: FontAwesomeIcons.bus,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Movies',
                            icon: FontAwesomeIcons.clapperboard,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Voting\n& Events',
                            icon: FontAwesomeIcons.checkToSlot,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Online\nPayment',
                            icon: FontAwesomeIcons.globe,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Antivirus',
                            icon: FontAwesomeIcons.shieldVirus,
                            onTap: () {},
                          ),
                          gridIcon(
                            title: 'Community\nElectricity',
                            icon: FontAwesomeIcons.chargingStation,
                            onTap: () {},
                          ),
                        ];

                        if (index >= children.length) {
                          return Container();
                        }

                        return children[index];
                      }),
                ),
                height: 595,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 29, 29, 29),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 15),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CarouselSlider.builder(
                        carouselController: controller,
                        itemCount: urlImages.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = urlImages[index];
                          return buildImage(urlImage, index);
                        },
                        options: CarouselOptions(
                            height: 150,
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            autoPlayInterval: Duration(seconds: 2),
                            autoPlayAnimationDuration: Duration(seconds: 1),
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) =>
                                setState(() => activeIndex = index))),
                    // SizedBox(height: 12),
                    // buildIndicator()
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.black),
                height: 250,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() => AnimatedSmoothIndicator(
        onDotClicked: animateToSlide,
        effect: ExpandingDotsEffect(dotWidth: 15, activeDotColor: Colors.blue),
        activeIndex: activeIndex,
        count: urlImages.length,
      );
  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildImage(String urlImage, int index) => ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        urlImage,
        fit: BoxFit.fill,
        scale: 0.5,
      ));
}

class gridIcon extends StatelessWidget {
  gridIcon({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 29, 29, 29),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(
                icon,
                color: Color.fromARGB(255, 140, 217, 129),
              ),
              SizedBox(height: 5),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 11,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
