import 'package:flutter/material.dart';
import 'package:instaclone/Screen/Profile.dart';
import 'package:instaclone/Screen/Search.dart';

/*
you can Customize this page ass per your choice
*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
    if (_selectedIndex == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MyHomePage()),
      );
    } 
    if (_selectedIndex == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Search()),
      );
    }
    if (_selectedIndex == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Profile()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            // Logo aligned to the left
            Image.asset(
              'assets/Instagram-Logo.png',
              fit: BoxFit.contain,
              height: 100,
            ),
            // Spacer to fill the space between the logo and icon button
            const Spacer(),
            // Icon button aligned to the right
            IconButton(
              icon: const Icon(
                Icons.add_box_outlined,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                // Add your onPressed callback function here
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.message_outlined,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              onPressed: () {
                // Add your onPressed callback function here
              },
            ),
            
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            // Circular story elements
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildStoryCircle("Your Story", 'assets/pfp1.png'),
                  const SizedBox(width: 16), // Add spacing between circles
                  _buildStoryCircle("Joe_mama", 'assets/pfp2.png'),
                  const SizedBox(width: 16), // Add spacing between circles
                  _buildStoryCircle("svt", 'assets/pfp3.png'),
                  const SizedBox(width: 16), // Add spacing between circles
                  _buildStoryCircle("_ay.u_", 'assets/pfp4.png'),
                  const SizedBox(width: 16), // Add spacing between circles
                  _buildStoryCircle("_Mr.Beast_", 'assets/pfp5.png'),
                  const SizedBox(width: 16), // Add spacing between circles
                  _buildStoryCircle("AkkiSaysChill", 'assets/pfp6.jpg'),
                ],
              ),
            ),
            const SizedBox(height: 26), // Add spacing between story and posts
            // Square posts
            _buildSquarePost('assets/post.gif', 'assets/pfp1.png', 'Java.__.x', 55, 3),
            const SizedBox(height: 26), // Add spacing between posts
            _buildSquarePost('assets/pfp2.png', 'assets/pfp2.png', 'Joe_mama', 55, 3),
            const SizedBox(height: 26), // Add spacing between posts
            _buildSquarePost('assets/pfp3.png', 'assets/pfp3.png', 'svt', 55, 3),
            const SizedBox(height: 26), // Add spacing between posts
            _buildSquarePost('assets/pfp4.png', 'assets/pfp4.png', '_ay.u_', 55, 3),
            const SizedBox(height: 26), // Add spacing between posts
            _buildSquarePost('assets/pfp5.png', 'assets/pfp5.png', '_Mr.Beast_', 55, 3),
            const SizedBox(height: 26), // Add spacing between posts
            _buildSquarePost('assets/pfp6.jpg', 'assets/pfp6.jpg', 'AkkiSaysChill', 55, 3),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white, // Adjust as needed
          unselectedItemColor: Colors.white70, // Adjust as needed
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildStoryCircle(String username, String imageLocation) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: Colors.transparent,
            ),
            gradient: const SweepGradient(
              colors: [
                Colors.red,
                Colors.orange,
                Colors.yellow,
                Colors.green,
                Colors.blue,
                Colors.indigo,
                Colors.purple,
                Colors.red,
              ],
            ),
          ),
          child: CircleAvatar(
            backgroundColor: Colors.black, // Transparent background
            backgroundImage: AssetImage(imageLocation),
          ),
        ),
        const SizedBox(height: 4), // Add spacing between the CircleAvatar and Text
        Text(
          username,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

Widget _buildSquarePost(String imageLocation, String profileImageLocation, String username, int likesCount, int commentsCount) {
  return Container(
    width: 350,
    height: 350,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10), // Rounded corners
      image: DecorationImage(
        image: AssetImage(imageLocation),
        fit: BoxFit.cover,
      ),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 8,
          left: 8,
          child: Row(
            children: [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage(profileImageLocation),
              ),
              const SizedBox(width: 8),
              Text(
                username,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 6,
          left: 8,
          child: Row(
            children: [
              const Icon(Icons.favorite, color: Colors.white),
              const SizedBox(width: 4),
              Text(
                '$likesCount likes',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.comment, color: Colors.white),
              const SizedBox(width: 4),
              Text(
                '$commentsCount comments',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.share, color: Colors.white),
            ],
          ),
        ),
      ],
    ),
  );
}
}