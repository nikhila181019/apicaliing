import 'dart:convert';

import 'package:apicaliing/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FetchData> fetchData=[];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context,snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
              itemCount: fetchData.length,
              itemBuilder: (context,index) {
                return Container(
                  height: 180,
                  color:Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'User id:${fetchData[index].userId}',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      Text(
                        'Id:${fetchData[index].id}',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      Text(
                        'Title:${fetchData[index].title}',
                        maxLines: 1,
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      Text(
                        'Body:${fetchData[index].body}',
                        maxLines: 2,
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                    ],),
                );
              }
          );
        }

        else{
          return(Center(child: Text("Data Fetch Failed"),));
        }
      }
    );
  }
  Future<List<FetchData>> getData() async{
    final response=await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200) {
      {
        for (Map <String, dynamic> index in data)
          fetchData.add(FetchData.fromJson(index));
      }
      return fetchData;
    }
    else{
      return fetchData;
    }

  }


}
