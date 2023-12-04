import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator/translator.dart';

class LanguageTranslatorScreen extends StatefulWidget {
  @override
  State<LanguageTranslatorScreen> createState() => _LanguageTranslatorScreenState();
}

class _LanguageTranslatorScreenState extends State<LanguageTranslatorScreen> {
  final List<String> _fromLanguages = [
    'English', 'Urdu', 'Spanish', 'French', 'German', 'Chinese', 'Japanese',
    'Korean', 'Arabic', 'Russian', 'Italian', 'Portuguese', 'Hindi',
    'Bengali', 'Dutch', 'Turkish', 'Swedish', 'Polish', 'Greek', 'Hebrew',
    'Thai', 'Vietnamese',
  ];

  final List<String> _toLanguages = [
    'English', 'Urdu', 'Spanish', 'French', 'German', 'Chinese', 'Japanese',
    'Korean', 'Arabic', 'Russian', 'Italian', 'Portuguese', 'Hindi',
    'Bengali', 'Dutch', 'Turkish', 'Swedish', 'Polish', 'Greek', 'Hebrew',
    'Thai', 'Vietnamese',
  ];

  final Map<String, String> languageCodes = {
    'English': 'en',
    'Urdu': 'ur',
    'Spanish': 'es',
    'French': 'fr',
    'German': 'de',
    'Chinese': 'zh',
    'Japanese': 'ja',
    'Korean': 'ko',
    'Arabic': 'ar',
    'Russian': 'ru',
    'Italian': 'it',
    'Portuguese': 'pt',
    'Hindi': 'hi',
    'Bengali': 'bn',
    'Dutch': 'nl',
    'Turkish': 'tr',
    'Swedish': 'sv',
    'Polish': 'pl',
    'Greek': 'el',
    'Hebrew': 'he',
    'Thai': 'th',
    'Vietnamese': 'vi',
  };
  bool loading = false;
  String _selectedfromLanguage = 'English';
  String _selectedtoLanguage = 'German';
  var outputText = 'Translation will be shown here';
  var inputController = TextEditingController();

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }


  GoogleTranslator translator = GoogleTranslator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF3A5BE),
      appBar: AppBar(
        title: Text('Language Translator'),
        backgroundColor: Color(0xff360E58),
        foregroundColor: Color(0xff82ABE1),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff44AC61),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 140,
                          child: DropdownButtonFormField<String>(
                            value: _selectedfromLanguage,
                            items: _fromLanguages.map((fromLanguage) {
                              return DropdownMenuItem<String>(
                                value: fromLanguage,
                                child: Text(fromLanguage,),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _selectedfromLanguage = value!;
                              });
                            },
                          ),
                        ),
                        FaIcon(FontAwesomeIcons.arrowsRotate),
                        Container(
                          width: 140,
                          child: DropdownButtonFormField<String>(
                            value: _selectedtoLanguage,
                            items: _toLanguages.map((toLanguage) {
                              return DropdownMenuItem<String>(
                                value: toLanguage,
                                child: Text(toLanguage,),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            onChanged: (value) {
                              setState(() {
                                _selectedtoLanguage = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Card(
                  elevation: 40,
                  child: Container(
                      color: Color(0xffAA91E6),
                      width: double.infinity,
                      height: 175,
                      child: Column(
                        children: [
                          Form(
                            child: TextFormField(
                              controller: inputController,
                              maxLines: 4,
                              decoration: InputDecoration(
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                filled: true,
                                fillColor: Color(0xffAA91E6),
                                hintText: 'Enter the text',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: IconButton(onPressed: () {
                                inputController.clear();
                              }, icon: Icon(Icons.delete,size: 30,))
                          ),
                        ],
                      )
                  ),
                ),
                SizedBox(height: 30,),
                Card(
                  elevation: 40,
                  child: Container(
                      color: Color(0xffAA91E6),
                      width: double.infinity,
                      height: 175,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: IconButton(onPressed: () {
                                copyToClipboard(outputText);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Text copied to clipboard')),
                                );
                              }, icon: Icon(Icons.copy_rounded,size: 30,))
                          ),
                          Expanded(child: Text(outputText))
                        ],
                      )
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.065,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff44AC61)
                      ),
                      onPressed: () {
                        try {
                          setState(() {
                            loading = true;
                          });
                          translator.translate(
                            inputController.text,
                            from: languageCodes[_selectedfromLanguage].toString(),
                            to: languageCodes[_selectedtoLanguage].toString(),
                          ).then((output) {
                            setState(() {
                              outputText = output.toString();
                            });
                            setState(() {
                              loading = false;
                            });
                          });
                        }
                        catch(e) {
                          print(e);
                        }
                      },
                      child: loading ? CircularProgressIndicator(color: Colors.white,) : Text('Translate',style: TextStyle(color: Colors.black,))
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
