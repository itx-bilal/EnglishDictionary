import 'package:englishdictionary/description_screen.dart';
import 'package:englishdictionary/history_screen.dart';
import 'package:englishdictionary/language_translator_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3A5BE),
      appBar: AppBar(
        title: Text('English Dictionary'),
        backgroundColor: Color(0xff360E58),
        foregroundColor: Color(0xff82ABE1),
      ),
      drawer: Drawer(
        child: Container(
          color: Color(0xff360E58),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 300,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xff82ABE1),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back)),
                      SizedBox(height: 20,),
                      Center(child: Icon(Icons.book,size: 100,)),
                      SizedBox(height: 10,),
                      Center(child: Text('English to English Dictionary'))
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.notifications_none, color: Color(0xff82ABE1),),
                title: Text('Notifications', style: TextStyle(color: Color(0xff82ABE1))),
                trailing: SizedBox(
                  width: 25,
                  child: Transform.scale(
                    scale: 0.8,
                    child: SwitchListTile(
                      activeColor: Color(0xff82ABE1),
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.share, color: Color(0xff82ABE1),),
                title: Text('Share App', style: TextStyle(color: Color(0xff82ABE1))),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip_rounded, color: Color(0xff82ABE1),),
                title: Text('Privacy Policy', style: TextStyle(color: Color(0xff82ABE1))),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30,),
                Card(
                  elevation: 40,
                  child: Container(
                    color: Color(0xff99EDC3),
                    width: double.infinity,
                    child: Form(
                      child: TextFormField(
                        decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          filled: true,
                          fillColor: Color(0xffEDF7F6),
                          prefixIcon: Icon(Icons.search,color: Colors.black,),
                          hintText: 'Search Word here',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Please enter category';
                          }
                          if(value!.length>25) {
                            return 'Title is too long';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(),));
                  },
                  child: Card(
                    elevation: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      width: double.infinity,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Word of the day',style: TextStyle(color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('Plump Down',style: TextStyle(fontSize: 30,color: Colors.white),),
                          SizedBox(height: 10,),
                          Text('Drop heavily',style: TextStyle(fontSize: 18,color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageTranslatorScreen(),));
                  },
                  child: Card(
                    elevation: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff20F326),
                      ),
                      width: double.infinity,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Language Translator'),
                            Icon(Icons.translate)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryScreen(),));
                  },
                  child: Card(
                    elevation: 40,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink,
                      ),
                      width: double.infinity,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('History',style: TextStyle(color: Colors.white),),
                            Icon(Icons.history,color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}