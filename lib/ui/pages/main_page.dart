part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavbarIndex;
  PageController pageController;

  @override
  void initState() {
    bottomNavbarIndex = 0;
    pageController = PageController(initialPage: bottomNavbarIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF6F7F9),
      body: Stack(
        children: [
          Container(
            color: accentColor1,
          ),
          SafeArea(
              child: Container(
            color: Color(0xFFF6F7F9),
          )),
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                bottomNavbarIndex = index;
              });
            },
            children: [
              MoviePage(),
              Center(child: Text('My Tickets')),
            ],
          ),

          // ClipPath
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: ButtonNavbarCLipper(),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: BottomNavigationBar(
                  onTap: (index) {
                    setState(() {
                      bottomNavbarIndex = index;
                      pageController.jumpToPage(index);
                    });
                  },
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  selectedItemColor: mainColor,
                  unselectedItemColor: Color(0xFFE5E5E5),
                  currentIndex: bottomNavbarIndex,
                  items: [
                    BottomNavigationBarItem(
                      title: Text(
                        'New Movies',
                        style: GoogleFonts.raleway(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: Image.asset(
                          bottomNavbarIndex == 0
                              ? 'assets/ic_movies.png'
                              : 'assets/ic_movies_gray.png',
                        ),
                      ),
                    ),
                    BottomNavigationBarItem(
                      title: Text(
                        'My Tickets',
                        style: GoogleFonts.raleway(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: Image.asset(
                          bottomNavbarIndex == 0
                              ? 'assets/ic_tickets_gray.png'
                              : 'assets/ic_tickets.png',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // Icon
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 46,
                width: 46,
                margin: EdgeInsets.only(bottom: 42),
                child: FloatingActionButton(
                  onPressed: () {
                    context.bloc<UserBloc>().add(SignOut());
                    AuthServices.signOut();
                  },
                  elevation: 0,
                  backgroundColor: accentColor2,
                  child: SizedBox(
                    height: 26,
                    width: 26,
                    child: Icon(
                      MdiIcons.walletPlus,
                      color: Colors.black.withOpacity(0.54),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

class ButtonNavbarCLipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 30, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 30, 33, size.width / 2 + 30, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
