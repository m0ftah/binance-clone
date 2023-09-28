import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tnance/providers/crypto_coin_provider.dart';


class SearchScreen extends StatefulWidget {
   SearchScreen({super.key});
final TextEditingController searchController = TextEditingController();

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CryptoProvider>(
      builder: (context,searchConsumer,_) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color:Colors.white),
          ),
          body: const SearchBar(
           
           hintText: "Search Coins",
            
          ),
        );
      }
    );
  }
}
