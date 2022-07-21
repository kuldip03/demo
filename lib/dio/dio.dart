import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(DioApp());

class DioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeApp());
  }
}

class HomeApp extends StatefulWidget {
  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  late Response response;
  Dio dio = Dio();

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  var apidata; //for decoded JSON data

  @override
  void initState() {
    getData(); //fetching data
    super.initState();
  }

  getData() async {
    setState(() {
      loading = true; //make loading true to show progressindicator
    });

    String url = "http://127.0.0.1/rest.php?auth=kjgdkhdfldfguttedfgr";
    //don't use "http://localhost/" use local IP or actual live URL

    Response response = await dio.get(url);
    apidata = response.data; //get JSON decoded data from response

    print(apidata); //printing the JSON recieved

    if (response.statusCode == 200) {
      //fetch successful
      if (apidata["error"]) {
        //Check if there is error given on JSON
        error = true;
        errmsg = apidata["msg"]; //error message from JSON
      }
    } else {
      error = true;
      errmsg = "Error while fetching data.";
    }

    loading = false;
    setState(() {}); //refresh UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data from REST API"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(20),
        child: loading
            ? CircularProgressIndicator()
            : //if loading == true, show progress indicator
            Container(
                //if there is any error, show error message
                child: error
                    ? Text("Error: $errmsg")
                    : Column(
                        //if everything fine, show the JSON as widget
                        children: apidata["data"].map<Widget>((country) {
                          return Card(
                            child: ListTile(
                              title: Text(country["name"]),
                              subtitle: Text(country["capital"]),
                            ),
                          );
                        }).toList(),
                      ),
              ),
      ),
    );
  }
}
