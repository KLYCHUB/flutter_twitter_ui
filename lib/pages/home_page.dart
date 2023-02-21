import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    // Diğer tema özellikleri
  );

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    // Diğer tema özellikleri
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
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  foregroundImage: AssetImage("assets/jpeg/ek.jpeg")),
            ),
          ),
          title: const Icon(
            Icons.sunny,
            color: Colors.blue,
          ),
        ),
        body: Column(children: [
          Divider(
            color: Colors.black,
          )
        ]),
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
                          children: [
                            Text("Eren KALAYCI",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            const Icon(
                              Icons.lock,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text("@erenklyctr",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.black54)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Text("28 ",
                                style: Theme.of(context).textTheme.titleSmall),
                            Text("Takip Edilen ",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.blueGrey[600])),
                            Text("16 ",
                                style: Theme.of(context).textTheme.titleSmall),
                            Text("Takipçi",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.blueGrey[600])),
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
                            child: const Center(
                              child: Text(
                                "Ne Aramıştınız...",
                                textAlign: TextAlign.center,
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
              const _DraverMidButton(),
              const _DraverMidButton(),
              const _DraverMidButton(),
              const _DraverMidButton(),
              const _DraverMidButton(),
              const _DraverMidButton(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(color: Colors.black),
              ),
              const _DrawerDropButton(),
              const _DrawerDropButton(),
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

class _DrawerDropButton extends StatelessWidget {
  const _DrawerDropButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 10, top: 20),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Drop Button",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DraverMidButton extends StatelessWidget {
  const _DraverMidButton();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 10),
              child: Icon(Icons.person_2_outlined, size: 30),
            ),
            Text("Button",
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
