import 'package:consumedotnetapiinflutter/api_handler.dart';
import 'package:consumedotnetapiinflutter/model.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ApiHandler apiHandler = ApiHandler();
 late List<User> data = [];

void getData() async {
  data = await apiHandler.getUserData();
  setState(() {
    
  });
}

@override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Flutter Api")),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      bottomNavigationBar: MaterialButton(
        color: Colors.teal ,
        textColor: Colors.white,
        padding: const EdgeInsets.all(10),
        onPressed: getData,
        child: const Text("Refresh"),
        ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context,int index){
              return ListTile(
                leading: Text("${data[index].UserId}"),
                title: Text(data[index].UserName),
                subtitle: Text(data[index].UserAddress),
              );
            }, 
          )
        ],
      ),
    );
  }
}