import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

import './coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCur = 'USD';

  CupertinoPicker getCupertinoPicker(){
    List<Text> myList = [];
    for (String myCur in currenciesList) {
      myList.add(Text(myCur));
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      itemExtent: 32.0,
      children: myList
    );
  }

  DropdownButton<String> getDropDownButton() {
    
    List<DropdownMenuItem<String>> myDropDownItems = [];
    for (String myCur in currenciesList) {
      myDropDownItems.add(DropdownMenuItem(
        value: myCur,
        child: Text(myCur),
      ));
    }

    return DropdownButton<String>(
      value: selectedCur,
      items: myDropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCur = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid?getDropDownButton():getCupertinoPicker(),
          ),
        ],
      ),
    );
  }
}
