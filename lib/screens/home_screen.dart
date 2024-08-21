import 'package:cards/constants/cards.dart';
import 'package:cards/extensions/get_text_theme.dart';
import 'package:cards/widgets/avatar_image.dart';
import 'package:cards/widgets/cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalRevenue = 2372.12;
  bool isSafeArea = true;
  double horizontalPadding = 6;
  double verticalPadding = 5;
  var itemCards = cards;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: isSafeArea,
        bottom: isSafeArea,
        child: Column(
          children: [
            appBar(),

            // * total revenue text
            revenue(),

            // * cards
            AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Stack(
                children: List.generate(4, (int index) {
                  final currentCard = itemCards[index];
                  int spacing = 120;

                  return Transform.translate(
                    offset: Offset(0, (spacing * index).toDouble()),
                    child: ColoredCards(
                      color: currentCard.color,
                      icon: Icons.person,
                      isLast: index == 3,
                      info: currentCard,
                      // onTap: () {
                      //   setState(() {
                      //     isSafeArea = !isSafeArea;
                      //     horizontalPadding = 0;
                      //     verticalPadding = 0;
                      //     itemCards.remove(currentCard);
                      //     itemCards = [...itemCards, currentCard];
                      //   });
                      // },
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget addButton() {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(40),
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget appBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 20),
      child: Row(
        children: [
          // ! the user's stacked images should be here
          userAvatar(),
          addButton(),
          const Spacer(),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(CupertinoIcons.chevron_down),
            ),
          )
        ],
      ),
    );
  }

  Widget revenue() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 100),
            alignment: Alignment.centerLeft,
            child: Text(
              "Total  Revenue",
              style: context.textTheme.headlineSmall?.copyWith(
                color: Colors.grey,
                letterSpacing: 1,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "\$$totalRevenue",
              style: context.textTheme.headlineLarge?.copyWith(
                fontSize: 56,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget userAvatar() {
    List imageUrls = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDJzEaxLN-jGRYYUO65pWu7Q9GXoNt4LUSSA&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&s",
    ];
    return Stack(
      children: [
        Row(
          children: [
            AvatarImage(url: imageUrls.elementAt(0)),
            Transform.translate(
              offset: const Offset(-8, 0),
              child: AvatarImage(url: imageUrls.elementAt(1)),
            )
          ],
        )
      ],
    );
  }
}

// String formatIntWithComas(double number) {
//   String numberString = number.toString();
//   List<String> numberList = numberString
//   return "";
// }
