import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_demo/rest_api_service.dart';
import 'login.dart';

class Home extends StatefulWidget {
  final String username;

  const Home({Key? key, required this.username}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final apiservice = RestAPIService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apiservice.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
        leading: Icon(
          Icons.home_outlined,
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: FutureBuilder(
              future: apiservice.getUsers(),
              builder: (context , snapshot){
                if(snapshot.hasData)
                {
                  return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index){

                        ////// User List item button

                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            child: ListTile(
                              title: Text("${snapshot.data![index].name}"),
                              subtitle: Text("${snapshot.data![index].city}"),
                            ),
                          ),
                        );
                      });
                }else{
                  return Container(
                    child: Center(
                      child: Text('Loading'),
                    ),
                  );
                }
              },
            ))
          ],
        ),
      ),
    );
  }
}
