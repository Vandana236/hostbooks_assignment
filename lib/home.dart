import 'package:flutter/material.dart';
import 'package:hostbooks/bloc/HomePageDataBloc.dart';
import 'package:hostbooks/models/SearchedUserReponse.dart';
import 'package:hostbooks/networking/ApiProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    TextEditingController controller= new TextEditingController();
  late HomeDataBloc homeDataBloc;
  bool loading = true;
  List<User> usersList = [];
  void handleResposne() {
    homeDataBloc.searchUserDataStream.listen((event) {
      if(event!='error'){
        print(event);
        SearchedUserReponse searchedUserReponse =
        SearchedUserReponse.fromJson(event);
        usersList.clear();
        usersList.addAll(searchedUserReponse.items);

      }
      setState(() {
        loading = false;
      });
    });
  }

  void searchUser(inputedText) {
    setState(() {
      loading = true;
    });
    homeDataBloc.callSearchUser(inputedText);
  }

  @override
  void initState() {
    homeDataBloc = HomeDataBloc();
    handleResposne();
    searchUser('');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.black,
          )),
      body: Column(
        children: [
          appBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: loading == true
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  :
              usersList.length==0?Center(
                child: Text("No Data Available"),
              ):
              ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return listView(usersList[index]);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: TextField(
            controller: controller,
            onChanged: (value) {
              if (value != null) {
                searchUser(value);
              } else {
                searchUser('');
              }
            },
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: Icon(Icons.search),
              suffixIcon: InkWell(
                onTap: (){
                  controller.clear();
                },
                  child: Icon(Icons.close)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
            ),
          ),
          // Text('Demo',
          //   style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),
          // )
        ),
      ),
    );
  }

  Widget listView(User user) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 1],
              colors: [Colors.grey, Colors.black54]),
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(user.avatarUrl))),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            user.login,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
