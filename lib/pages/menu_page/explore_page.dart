import 'package:flutter/material.dart';
import 'package:soul_serenity/model/card_item.dart';
import 'package:soul_serenity/model/card_widget.dart';
import 'package:soul_serenity/model/description_page.dart';
import 'package:soul_serenity/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soul_serenity/pages/login_page.dart';
import 'package:soul_serenity/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:soul_serenity/pages/login_page.dart';
import 'package:soul_serenity/model/card_item.dart';
import 'package:soul_serenity/model/card_widget.dart';
import 'package:soul_serenity/model/description_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();
  List<CardItem> allCards = [
    CardItem(
        'UK study confirms Mediterranean lifestyle benefits',
        'By Heidi Godman',
        'assets/image 1.png',
        'Staying Healthy'),
    CardItem('Denial: How it hurts, how it helps, and how to cope',
        'By Heidi Godman', 'assets/image 2.png', 'Mind & Mood'),
    CardItem('Invisible illness: More than meets the eye', 'By Maureen Salamon',
        'assets/image 4.png', 'Mind & Mood'),
    CardItem('Can you feel younger than your age?', 'By Matthew Solan',
        'assets/image 5.png', 'Staying Healthy'),
    CardItem('Sowing the seeds of better health', 'By Maureen Salamon',
        'assets/image 6.png', 'Staying Healthy'),
    CardItem('Is online gambling harming you?', 'By Matthew Solan',
        'assets/image 7.png', 'Mind & Mood'),
    CardItem(
        'Blasting through mental health misperceptions',
        'By Maureen Salamon',
        'assets/image 8.png',
        'Staying Healthy'),
    CardItem('Denial: How it hurts, how it helps, and how to cope',
        'By Heidi Godman', 'assets/explore_image/image 2.png', 'Mind & Mood'),
    CardItem('Invisible illness: More than meets the eye', 'By Maureen Salamon',
        'assets/explore_image/image 4.png', 'Mind & Mood'),
    CardItem('Can you feel younger than your age?', 'By Matthew Solan',
        'assets/explore_image/image 5.png', 'Staying Healthy'),
    CardItem('Sowing the seeds of better health', 'By Maureen Salamon',
        'assets/explore_image/image 6.png', 'Staying Healthy'),
    CardItem('Is online gambling harming you?', 'By Matthew Solan',
        'assets/explore_image/image 7.png', 'Mind & Mood'),
    CardItem(
        'Blasting through mental health misperceptions',
        'By Maureen Salamon',
        'assets/explore_image/image 8.png',
        'Mind & Mood'),
  ];
  List<CardItem> filteredCards = [];

  @override
  void initState() {
    filteredCards = allCards;
    super.initState();
  }

  void _performSearch(String query) {
    List<CardItem> searchResults = allCards.where((card) {
      bool isTitleMatch =
          card.title.toLowerCase().contains(query.toLowerCase());
      bool isAuthorMatch =
          card.author.toLowerCase().contains(query.toLowerCase());
      bool isThemeMatch =
          card.theme.toLowerCase().contains(query.toLowerCase());

      return isTitleMatch || isAuthorMatch || isThemeMatch;
    }).toList();

    setState(() {
      filteredCards = searchResults;
    });
  }

  void _navigateToDescriptionPage(CardItem card) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DescriptionPage(card: card),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // TOP BAR
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset("assets/logo.png", width: 50),
                  Text(
                    "Explore",
                    style:
                        boldTextStyle.copyWith(fontSize: 16, color: greenColor),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            print("Signed Out");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          });
                        },
                        child: Image.asset("assets/akun.png")),
                  ),
                ],
              ),
            ),
            // TOP BAR
            // SEARCH BOX
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: green2Color,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: TextField(
                    controller: _searchController,
                    style: regulerTextStyle.copyWith(color: greenColor),
                    cursorColor: greenColor,
                    onChanged: (query) {
                      _performSearch(query);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.search_sharp),
                        hintText: "Search",
                        hintStyle: regulerTextStyle.copyWith(
                            color: greenColor.withOpacity(0.5), fontSize: 14)),
                  ),
                ),
              ),
            ),
            // SEARCH BOX
            // CARD
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredCards.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToDescriptionPage(filteredCards[index]);
                  },
                  child: ExploreCardWidget(card: filteredCards[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
