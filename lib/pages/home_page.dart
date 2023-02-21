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

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> myScaffoldKey = GlobalKey<ScaffoldState>();

    return MaterialApp(
      theme: isDarkMode ? darkTheme : lightTheme,
      home: Scaffold(
        key: myScaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              myScaffoldKey.currentState?.openDrawer();
            },
            icon: const Padding(
              padding: EdgeInsets.only(top: 5),
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  foregroundImage: AssetImage("assets/jpeg/ek.jpeg")),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Image.asset(
              "assets/jpeg/tw.jpeg",
              height: 45,
              color: Colors.blue,
            ),
          ),
        ),
        body: Column(
          children: const [
            Divider(
              color: Color.fromARGB(110, 120, 144, 156),
            )
          ],
        ),
        drawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            foregroundImage: AssetImage("assets/jpeg/ek.jpeg")),
                      ),
                      Padding(
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
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: _UserName("@enklyctr"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: const [
                            _FollowFollowers("27 "),
                            _UserName("Takip Edilen  "),
                            _FollowFollowers("15 "),
                            _UserName("Takipçi"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          context: context,
                          builder: (context) => SizedBox(
                            height: MediaQuery.of(context).size.width / 1.5,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
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
                                          ?.copyWith(
                                              fontWeight: FontWeight.w900),
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          foregroundImage: AssetImage(
                                              "assets/jpeg/ek.jpeg")),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
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
                                              padding:
                                                  EdgeInsets.only(bottom: 15),
                                              child: _UserName("@enklyctr"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(
                                        Icons.verified,
                                        color: Colors.blue,
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.blueGrey),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text('Yeni Hesap Oluştur',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: TextButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.blueGrey),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Var Olan Hesabı Ekle',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 15)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.supervisor_account),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Divider(color: Colors.black),
              ),
              const _DraverMidButton(
                "Profil",
                Icon(
                  Icons.person_2_outlined,
                  size: 35,
                ),
              ),
              const _DraverMidButton(
                  "Konular",
                  Icon(
                    Icons.chat_outlined,
                    size: 35,
                  )),
              const _DraverMidButton(
                  "Yer İşaretleri",
                  Icon(
                    Icons.save_outlined,
                    size: 35,
                  )),
              const _DraverMidButton(
                  "Listeler",
                  Icon(
                    Icons.featured_play_list_outlined,
                    size: 35,
                  )),
              const _DraverMidButton(
                  "Twitter Çevresi",
                  Icon(
                    Icons.person_pin_circle_outlined,
                    size: 35,
                  )),
              const _DraverMidButton(
                  "Takipçi istekleri",
                  Icon(
                    Icons.person_add_alt,
                    size: 35,
                  )),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Divider(color: Colors.black),
              ),
              const _DrawerDropButton("Profesyonel Araçlar"),
              const _DrawerDropButton("Ayarlar & Destek"),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 30),
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                    });
                  },
                  icon: const Icon(Icons.light_mode_outlined),
                ),
              ),
            ],
          ),
        ),
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
            fontWeight: FontWeight.bold, color: Theme.of(context).hintColor));
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

class _DraverMidButton extends StatelessWidget {
  const _DraverMidButton(this.buttonName, this.draverButton);

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
            Text(buttonName,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
