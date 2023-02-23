import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
  );

  bool isDarkMode = false;

  int _selectedButton = 0;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> myScaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? darkTheme : lightTheme,
      home: Scaffold(
        key: myScaffoldKey,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: _appBarTitle(),
          backgroundColor: Colors.transparent,
          leading: _IconButton(myScaffoldKey: myScaffoldKey),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              children: [
                _bodyDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _selectedButton = 1;
                            });
                          },
                          style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(0),
                            backgroundColor: _selectedButton == 1
                                ? MaterialStateProperty.all<Color>(
                                    Colors.transparent)
                                : null,
                          ),
                          child: _AccountName("Sana Özel"),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _selectedButton = 2;
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: _selectedButton == 2
                                ? MaterialStateProperty.all<Color>(
                                    Colors.transparent)
                                : null,
                          ),
                          child: _AccountName("Takip Edilenler"),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 2,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: _selectedButton == 1
                                ? Colors.blue
                                : Colors.transparent,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            color: _selectedButton == 2
                                ? Colors.blue
                                : Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _bodyDivider(),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    children: const <Widget>[
                      _ListView(),
                      _ListView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: SafeArea(
          child: Drawer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _drawerPhoto(),
                        _userTitle(),
                        _userAccountName(),
                        _userStats(),
                      ],
                    ),
                    const _AccountAddLogin(),
                  ],
                ),
                _drawerDivider(),
                const _DrawerList(
                    "Profil", Icon(Icons.person_2_outlined, size: 26)),
                const _DrawerList(
                    "Konular", Icon(Icons.chat_outlined, size: 26)),
                const _DrawerList(
                    "Yer İşaretleri", Icon(Icons.save_outlined, size: 26)),
                const _DrawerList("Listeler",
                    Icon(Icons.featured_play_list_outlined, size: 26)),
                const _DrawerList("Twitter Çevresi",
                    Icon(Icons.person_search_outlined, size: 26)),
                const _DrawerList(
                    "Takipçi istekleri", Icon(Icons.person_add_alt, size: 26)),
                _drawerDivider(),
                const _DrawerDropButton("Profesyonel Araçlar"),
                const _DrawerDropButton("Ayarlar & Destek"),
                const Spacer(flex: 3),
                _themaButton(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: BottomNavBarColor().black,
          unselectedItemColor: BottomNavBarColor().grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.home,
                  size: 25,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.search,
                  size: 25,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.notifications_none_outlined,
                  size: 25,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Icon(
                  Icons.mail,
                  size: 25,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  //----------------------------------------------------------------------------

  Padding _drawerDivider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Divider(color: Color.fromARGB(169, 61, 61, 61)),
    );
  }

  Divider _bodyDivider() =>
      const Divider(color: Color.fromARGB(110, 120, 144, 156));

  Padding _themaButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, bottom: 30),
      child: IconButton(
        onPressed: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        icon: const Icon(Icons.light_mode_outlined),
      ),
    );
  }

  Padding _userStats() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: const [
          _FollowFollowers("28 "),
          _UserName("Takip Edilen  "),
          _FollowFollowers("15 "),
          _UserName("Takipçi"),
        ],
      ),
    );
  }

  Padding _userAccountName() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 15, top: 2),
      child: _UserName("@erenklyctr"),
    );
  }

  Padding _userTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: const [
          _AccountName("Eren KALAYCI"),
          Icon(
            Icons.lock,
            size: 15,
          ),
        ],
      ),
    );
  }

  Padding _drawerPhoto() {
    return const Padding(
      padding: EdgeInsets.only(top: 30),
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          foregroundImage: AssetImage("assets/jpeg/ek.jpeg")),
    );
  }

  Padding _appBarTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Image.asset(
        "assets/jpeg/tw.jpeg",
        height: 35,
        color: Colors.blue,
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 5),
                      child: Icon(
                        Icons.person,
                        size: 20,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      child: _UserName(
                        "Flutter Takip Eddiyor",
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          foregroundImage: AssetImage("assets/jpeg/ek.jpeg")),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            _AccountName("Eren KALAYCI "),
                            _UserName("@enklyctr"),
                            _UserName("  3 sa"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            children: const [Text("Selamun Aleyküm")],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            width: 300,
                            height: 200,
                            child: Image.asset(
                              'assets/jpeg/ts.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: _UserName(
                            "3Mn görüntülenme - Kimden Trabzonspor",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            width: 300,
                            child: _PostIcon(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _PostIcon extends StatelessWidget {
  const _PostIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          Icons.chat_bubble_outline_rounded,
          size: 20,
          color: Theme.of(context).hintColor,
        ),
        Icon(
          Icons.refresh_rounded,
          size: 20,
          color: Theme.of(context).hintColor,
        ),
        Icon(
          Icons.heart_broken_outlined,
          size: 20,
          color: Theme.of(context).hintColor,
        ),
        Icon(
          Icons.signal_cellular_alt_outlined,
          size: 20,
          color: Theme.of(context).hintColor,
        ),
      ],
    );
  }
}

//------------------------------------------------------------------------------

class _AccountAddLogin extends StatelessWidget {
  const _AccountAddLogin();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            context: context,
            builder: (context) => SizedBox(
              height: MediaQuery.of(context).size.width / 1.5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Hesaplar",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundImage: AssetImage("assets/jpeg/ek.jpeg")),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  _AccountName("Eren KALAYCI"),
                                  Icon(
                                    Icons.lock,
                                    size: 15,
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: _UserName("@enklyctr"),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.check_circle_rounded,
                          color: Colors.green,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: _FollowFollowers("Yeni Hesap Oluştur"),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: _FollowFollowers("Var Olan Bir Hesabı Ekle"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        icon: const Icon(Icons.filter_tilt_shift_rounded),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.myScaffoldKey,
  });

  final GlobalKey<ScaffoldState> myScaffoldKey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        myScaffoldKey.currentState?.openDrawer();
      },
      icon: const Padding(
        padding: EdgeInsets.only(top: 5),
        child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.transparent,
            foregroundImage: AssetImage("assets/jpeg/ek.jpeg")),
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  const _UserName(
    this.dropName,
  );

  final String dropName;

  @override
  Widget build(BuildContext context) {
    return Text(dropName,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: Theme.of(context).hintColor, fontWeight: FontWeight.normal));
  }
}

class _FollowFollowers extends StatelessWidget {
  const _FollowFollowers(
    this.dropName,
  );

  final String dropName;

  @override
  Widget build(BuildContext context) {
    return Text(dropName,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ));
  }
}

class _AccountName extends StatelessWidget {
  const _AccountName(
    this.dropName,
  );

  final String dropName;

  @override
  Widget build(BuildContext context) {
    return Text(dropName,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.bold));
  }
}

class _DrawerDropButton extends StatelessWidget {
  const _DrawerDropButton(this.dropName);

  final String dropName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 10, top: 20),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dropName,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerList extends StatelessWidget {
  const _DrawerList(this.buttonName, this.draverButton);

  final String buttonName;
  final Icon draverButton;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: draverButton,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                buttonName,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarColor {
  final Color grey = Colors.grey;
  final Color black = Colors.black;
}
