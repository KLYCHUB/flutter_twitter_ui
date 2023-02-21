import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> myScaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: myScaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            myScaffoldKey.currentState?.openDrawer();
          },
          icon: const Padding(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              foregroundImage: NetworkImage(
                'https://pbs.twimg.com/profile_images/1531034527115640838/MtMdKs5F_400x400.jpg',
              ),
            ),
          ),
        ),
        title: const Icon(
          Icons.sunny,
          color: Colors.blue,
        ),
      ),
      body: Column(),
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
                        foregroundImage: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1531034527115640838/MtMdKs5F_400x400.jpg',
                        ),
                      ),
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
                              ?.copyWith(color: Colors.blueGrey[600])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Text("28 ",
                              style: Theme.of(context).textTheme.titleSmall),
                          Text("Takip  ",
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
            const Divider(color: Colors.black),
            const _DraverMidButton(),
            const _DraverMidButton(),
            const _DraverMidButton(),
            const _DraverMidButton(),
            const _DraverMidButton(),
            const _DraverMidButton(),
            const Divider(color: Colors.black),
            const _DraverMidButton(),
            const _DraverMidButton(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            const Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 30, bottom: 30),
              child: const Icon(Icons.light_mode_outlined),
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
              child: Icon(Icons.person_2_outlined, size: 25),
            ),
            Text("Eren KALAYCI",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
