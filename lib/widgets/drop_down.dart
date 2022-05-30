import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';


class dropdown_menu extends StatelessWidget {
  const dropdown_menu({
    Key? key,
    required this.width,
    required this.myFocusNode,
    required this.list,
    required this.name,
  }) : super(key: key);

  final double width;
  final FocusNode myFocusNode;
  final List<String> list;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width*0.55,
      child: DropdownSearch<String>(
        popupShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        scrollbarProps: ScrollbarProps(
          isAlwaysShown: false,
          thickness: 5,
          radius: Radius.circular(10),

        ),
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            labelText: 'Ara',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        focusNode: myFocusNode,
        popupElevation: 0,
        mode: Mode.DIALOG,
        showSearchBox: true,
        showSelectedItems: true,
        items: list,
        dropdownSearchDecoration: InputDecoration(
          labelText: name,
          labelStyle: TextStyle(fontSize: 14,),
          floatingLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          contentPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
          border: OutlineInputBorder(
            borderSide: BorderSide(
            ),
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(

              )
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
              )
          ),
        ),
      ),
    );
  }
}