import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'custom_dropdown.dart';
// import 'colors.dart';

class Recipe extends StatefulWidget {
  const Recipe({Key? key}) : super(key: key);

  @override
  _RecipeState createState() => _RecipeState();
}

/*
Shared Preferences yang di gunakan di aplikasi ini untuk memasukan text di text field lalu di save
kemudian tutup aplikasi buka kembali tekan tombol load
*/

class _RecipeState extends State<Recipe> {
  static const String prefSearchKey = 'previousSearches';
  bool inErrorState = false;
  List<String> previousSearches = <String>[];

  void savePreviousSearches() async {
    // 1
    final prefs = await SharedPreferences.getInstance();
    // 2
    prefs.setStringList(prefSearchKey, previousSearches);
  }

  void getPreviousSearches() async {
    // 1getPreviousSearches()
    final prefs = await SharedPreferences.getInstance();
    // 2
    if (prefs.containsKey(prefSearchKey)) {
      //
      previousSearches = prefs.getStringList(prefSearchKey)!;

      if (previousSearches == null) {
        previousSearches = <String>[];
      }
    }
  }

  TextEditingController controller = TextEditingController(text: "No Name");

  void saveData()async
  {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("nama", controller.text);
  }

  Future<String> getNama() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("nama") ?? "No Name";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 15),
                      child: Text(
                        "Recipes",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 22),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),

                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        controller: controller,
                      ),

                      RaisedButton(
                        child: Text("Save"),
                        onPressed: () {
                         saveData();
                        },
                      ),

                      RaisedButton(
                        child: Text("Load"),
                          onPressed: (){
                           getNama().then((s){
                             controller.text = s;
                           });
                            setState(() {
                            });
                            }
                      )
                    ],
                  ),
                ),

              ],
            ),
          ],
        )

      )
      ,
    );

  }


}



