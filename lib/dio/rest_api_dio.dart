import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DemoAppHome());
  }
}

class DemoAppHome extends StatefulWidget {
  const DemoAppHome({Key? key}) : super(key: key);
  @override
  State<DemoAppHome> createState() => _HomeState();
}

class _HomeState extends State<DemoAppHome> {
  late Response response;
  Dio dio = Dio();

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  var apidata; //for decoded JSON data
  String url = "http://127.0.0.1/rest.php";
  var arguements = {
    'auth': 'kjhadskjhhbweuhbjhbshbueiunbviujngjhdsvannahadjk',
    'fun': 12,
    'sql': 'shoe'
  };

  @override
  void initState() {
    getData(); //fetching data
    super.initState();
  }

  getData() async {
    setState(() {
      loading = true; //make loading true to show progressindicator
    });

    //Response response = await dio.get(url);
    //Response response = await dio.get(url, queryParameters: arguements);
    response = await dio.post(url, queryParameters: arguements);
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
        title: Text("Get and Post"),
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
                        children: apidata["data"].map<Widget>(
                          (country) {
                            return Card(
                              child: ListTile(
                                title: Text(country["name"]),
                                subtitle: Text(country["capital"]),
                              ),
                            );
                          },
                        ).toList(),
                      ),
              ),
      ),
    );
  }
}

/*
class DemoApi {
  final String url = "http://127.0.0.1/rest.php";
  var arguements = {
    'auth': 'kjhadskjhhbweuhbjhbshbueiunbviujngjhdsvannahadjk',
    'fun': 12,
    'sql': 'shoe'
  };
  static bool error = false; //for error status
  static bool loading = false; //for data featching status
  static String errmsg = ""; //to assing any error message from API/runtime
  static var apidata; //for decoded JSON data
  static late Response response;
  static Dio dio = Dio();

  callApi() async {
    //response = await dio.get(url);
    //response = await dio.get(url, queryParameters: arguements);
    response = await dio.post(url, queryParameters: arguements);
    apidata = response.data; //get JSON decoded data from response

    print(apidata); //printing the JSON recieved

    if (response.statusCode == 200) {
      //fetch successful
      if (apidata["error"]) /* if error is true*/
      {
        error = true;
        errmsg = apidata["msg"]; //error message from JSON
      } else {}
    } else {
      error = true;
      errmsg = "Error while fetching data.";
    }
  }
}*/
