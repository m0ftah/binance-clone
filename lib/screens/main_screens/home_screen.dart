import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tnance/helper/constans.dart';
import 'package:tnance/providers/crypto_coin_provider.dart';
import 'package:tnance/screens/auth_screens/splash_screen.dart';
import 'package:tnance/widgets/coin_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<CryptoProvider>(builder: (context, cryptoconsumer, _) {
      return Scaffold(
        drawer: Drawer(
          child: SafeArea(
              child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const SplashScreen()));
                },
                child: ListTile(
                  title: const Text("My Profile"),
                  trailing: Icon(
                    Icons.person,
                    size: 30,
                    color: seconderycolor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const ListTile(
                  title: Text("Contact Us"),
                  trailing: Icon(Icons.headphones),
                ),
              ),
            ],
          )),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: seconderycolor),
          centerTitle: true,
          title: Hero(
              tag: 'logo',
              child: Image.asset(
                'assets/main_logo.png',
                width: size.width * 0.16,
              )),
        ),
        body: AnimatedSwitcher(
          duration: const Duration(microseconds: 300),
          child: cryptoconsumer.isFailed
              ? SizedBox(
                  height: size.height * 1.1,
                  child: Center(
                      child: Text(
                    "Somthing went wrong!",
                    style: TextStyle(fontSize: 20, color: primaryColor),
                  )),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    Provider.of<CryptoProvider>(context, listen: false)
                        .fetchCoins();
                  },
                  child: GridView.builder(
                    padding: const EdgeInsets.all(24),
                    itemBuilder: (context, index) {
                      return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: cryptoconsumer.isLoading
                              ? Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: seconderycolor.withOpacity(0.16),
                                    ),
                                  ),
                                  child: Shimmer.fromColors(
                                      baseColor:
                                          seconderycolor.withOpacity(0.2),
                                      highlightColor: base2.withOpacity(0),
                                      enabled: true,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: primaryColor),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: _,
                                      )),
                                )
                              : CoinCrad(
                                  cryptoCurrncyModel:
                                      cryptoconsumer.coins[index]));
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.5,
                            mainAxisSpacing: 24,
                            crossAxisSpacing: 24),
                  ),
                ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: primaryColor,
          selectedItemColor: seconderycolor,
          unselectedItemColor: base2,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      );
    });
  }
}
