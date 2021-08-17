import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:swap/model/people_model.dart';
import 'package:swap/services/service.dart';
import 'package:swap/views/source/colors.dart';

class MainScreen extends StatefulWidget {
  final User user;

  MainScreen(this.user);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  String userName = "";
  Future<Result> dataCharacters;

  TabController _tabController;

  @override
  void initState() {
    setState(() {
      if (widget.user.email.contains("_")) {
        userName =
            widget.user.email.substring(0, widget.user.email.indexOf("_"));
      } else if (widget.user.email.indexOf(".") <
          widget.user.email.indexOf("@")) {
        userName =
            widget.user.email.substring(0, widget.user.email.indexOf("."));
      } else {
        userName =
            widget.user.email.substring(0, widget.user.email.indexOf("@"));
      }
    });
    _tabController = new TabController(length: 2, vsync: this);
    dataCharacters = Services.fetchAlbum();
    if(dataCharacters == null){
      print('Checking data of dataCharacters is null');
    }else{
      print('Checking data of dataCharacters is not null');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaWidth = MediaQuery.of(context).size.width;
    var mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(AppColors.primaryColorMainApp),
      body: Column(
        children: [
          SizedBox(
            height: kToolbarHeight,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: mediaWidth / 1.5,
                height: 50,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Character Name",
                    hintText: "Luke",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontFamily: "OpenSans400",
                    ),
                    labelStyle: TextStyle(
                      fontFamily: "OpenSans400",
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.6),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.6),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                      borderSide: BorderSide(
                        color: Colors.white.withOpacity(0.6),
                        width: 1,
                      ),
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                  ),
                  /*controller: emailController,*/
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  "${widget.user.email.substring(0, 2).toUpperCase()}",
                  style: TextStyle(fontFamily: "OpenSans700", fontSize: 18),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Text(
              "Hello $userName, welcome to Star wars characters enciclopedia app. Here you can search about star wars characters with the details, create, update and also delete.",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white, fontFamily: "OpenSans500"),
            ),
          ),
          TabBar(
            unselectedLabelColor: Colors.black,
            labelColor: Colors.red,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.list,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.grid_on,
                  color: Colors.white,
                ),
              )
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Icon(
                  Icons.directions_car,
                  color: Colors.white,
                ),
                Icon(
                  Icons.directions_transit,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
