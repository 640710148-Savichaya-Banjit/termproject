import 'package:flutter/material.dart';
import 'package:termproject/page/movie.dart';
import 'package:termproject/page/user.dart';

//import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _ClickButton(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget SwitchPage() {
      switch (_selectedIndex) {
        case 0:
          return const Movie();
        case 1:
          return const User();
        default:
          return const Movie();
      }
    }

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 0.0, 8.0),
          child: Image.asset('asstes/images/icon.png'),
        ),
        title: Text(
          'Big Cinema',
          style: TextStyle(color: Colors.white),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 65.0,
        padding: EdgeInsets.zero,
        color: Color(0xFFB71C1C),
        //shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: AppBottomMenuItem(
                iconData: Icons.movie_creation,
                text: 'Movie',
                isSelected: _selectedIndex == 0,
                onClick: () {
                  _ClickButton(0);
                },
              ),
            ),
            SizedBox(width: 40.0),
            Expanded(
              child: AppBottomMenuItem(
                iconData: Icons.account_circle,
                text: 'User',
                isSelected: _selectedIndex == 1,
                onClick: () => _ClickButton(1),
              ),
            ),
          ],
        ),
      ),
      body: SwitchPage(),
    );
  }
}

class AppBottomMenuItem extends StatelessWidget {
  AppBottomMenuItem({
    super.key,
    required this.iconData,
    required this.text,
    required this.isSelected,
    required this.onClick,
  });

  final IconData iconData;
  final String text;
  final bool isSelected;
  final VoidCallback
      onClick; //การส่งฟังก์ชั้นเข้ามา มีการอัพเดทมาจากตัวหน้าจอเลย

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var color = isSelected ? Colors.white : Colors.white60;

    return ClipOval(
      child: Material(
        color: Colors.transparent, // button color
        child: InkWell(
          // splashColor: kSplashColor,
          onTap: onClick, // button pressed
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(iconData, color: color, size: 32.0),
              SizedBox(height: 150.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelMedium!
                      .copyWith(color: color, fontSize: 15.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
