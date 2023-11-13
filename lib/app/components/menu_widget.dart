import 'package:flutter/material.dart';
// import 'package:get/get.dart';

//
Widget buildHeader() {
  return Column(
    children: [
      Image.asset(
        'image/banner.png',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1B1B1B),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.white.withOpacity(0.5)),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: Colors.white.withOpacity(0.75),
                ),
              ),
              Expanded(
                child: TextFormField(
                  style: TextStyle(color: Colors.white.withOpacity(0.75)),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.75)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

//
Widget buildCategoryGrid() {
  return GridView.count(
    physics: const NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    padding: const EdgeInsets.all(0),
    shrinkWrap: true,
    children: [
      CategoryItem(
        image: 'image/1.png',
        text: 'New',
        icon: Icons.new_releases,
        onPressed: () {
          //  Get.toNamed();
        },
      ),
      CategoryItem(
        image: 'image/2.png',
        text: 'Special',
        icon: Icons.local_offer,
        onPressed: () {
          // Tambahkan kode yang ingin dijalankan saat Category 2 ditekan
        },
      ),
      CategoryItem(
        image: 'image/3.png',
        text: 'Populer',
        icon: Icons.trending_up,
        onPressed: () {
          // Tambahkan kode yang ingin dijalankan saat Category 3 ditekan
        },
      ),
      CategoryItem(
        image: 'image/4.png',
        text: 'Free',
        icon: Icons.free_breakfast,
        onPressed: () {
          // Tambahkan kode yang ingin dijalankan saat Category 4 ditekan
        },
      ),
    ],
  );
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  CategoryItem({
    required this.image,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.white.withOpacity(0.5)),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white.withOpacity(0.75),
                    size: 32,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//
Widget buildRecommendationList() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.only(top: 24, left: 16, bottom: 10),
        child: Text(
          'Recommendation',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: games.length,
        itemBuilder: (context, index) {
          final game = games[index];
          final limitedName = game.name.length > 20
              ? game.name.substring(0, 20) + '...'
              : game.name;

          return Container(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 80,
                  height: 80,
                  child: Image.asset(
                    game.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    limitedName,
                    style: const TextStyle(color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "${game.genre}",
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                  const SizedBox(height: 1),
                  Text(
                    "${game.price}",
                    style: TextStyle(color: Colors.white.withOpacity(0.8)),
                  ),
                ],
              ),
              contentPadding: const EdgeInsets.only(bottom: 15, left: 15),
            ),
          );
        },
      ),
    ],
  );
}

class Game {
  final String name;
  final String genre;
  final String price;
  final String imagePath;

  Game({
    required this.name,
    required this.genre,
    required this.price,
    required this.imagePath,
  });
}

final games = [
  Game(
    name: "PUBG",
    genre: "Open World · FPS",
    price: "Free",
    imagePath: 'image/banner.png',
  ),
  Game(
    name: "Stumble Guys",
    genre: "Parkour · Multiplayer",
    price: "Free",
    imagePath: 'image/banner.png',
  ),
  Game(
    name: "Girls' Connect: Idle RPG",
    genre: "Idle · Gacha",
    price: "Rp 100.000,00",
    imagePath: 'image/banner.png',
  ),
];
