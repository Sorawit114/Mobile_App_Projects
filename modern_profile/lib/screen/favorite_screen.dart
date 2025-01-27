import 'package:flutter/material.dart';
import 'package:modern_profile/constant/constant.dart';

class Favorite_Screen extends StatefulWidget {
  const Favorite_Screen({super.key});

  @override
  State<Favorite_Screen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<Favorite_Screen> {
  final List<String> favoriteItems = ['Ocean', 'sky', 'mountain', 'forest'];
  final TextEditingController _controller = TextEditingController();

  void _addFavoriteItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        favoriteItems.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Favorite Items',
            style: textTitle,
          ),
        ),
        backgroundColor: bgSecondaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Enter new favorite item',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _addFavoriteItem,
              child: Text('Add to Favorites'),
              style: ElevatedButton.styleFrom(
                backgroundColor: iconPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: favoriteItems.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: bgSecondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(0xFFF8E7F6),
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xFFDD88CF),
                        ),
                      ),
                      title: Text(
                        favoriteItems[index],
                        style: textSubTitle,
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Color(0xFFC62300),
                        ),
                        onPressed: () {
                          setState(() {
                            favoriteItems.removeAt(index);
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
