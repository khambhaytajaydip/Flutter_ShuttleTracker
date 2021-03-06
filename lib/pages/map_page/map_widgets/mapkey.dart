import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/theme/theme_bloc.dart';
import '../../../models/shuttle_image.dart';

import 'mapkey_row.dart';

class Mapkey extends StatefulWidget {
  final Map<String, ShuttleImage> mapkey;

  Mapkey({this.mapkey});

  @override
  _MapkeyState createState() => _MapkeyState();
}

class _MapkeyState extends State<Mapkey> {
  @override
  Widget build(BuildContext context) {
    var mapkeyRows = <Widget>[
      MapkeyRow(
        widget: Image.asset('assets/img/user.png'),
        text: ' You',
      ),
    ];
    widget.mapkey.forEach((key, value) {
      mapkeyRows.add(MapkeyRow(
        widget: value.getSVG,
        text: " $key",
      ));
    });
    mapkeyRows.add(MapkeyRow(
      widget: Image.asset('assets/img/circle.png'),
      text: ' Shuttle Stop',
    ));
    //print("Number of rows in mapkey: ${mapkeyRows.length}\n\n");
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, theme) {
      return Positioned(
        bottom: 40,
        left: 10,
        child: Opacity(
          opacity: 0.90,
          child: Container(
            decoration: BoxDecoration(
                color: theme.getTheme.backgroundColor,
                border: Border.all(
                  width: 5,
                  color: theme.getTheme.backgroundColor,
                ),
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: theme.getTheme.hoverColor,
                      offset: Offset(0.0, 1.0))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: mapkeyRows,
            ),
          ),
        ),
      );
    });
  }
}
