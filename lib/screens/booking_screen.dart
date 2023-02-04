import 'dart:ffi';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/theme.dart';
import 'package:flutter/cupertino.dart';

class BookingScreen extends StatelessWidget {
  static Route route(spaceData, bookedData) => MaterialPageRoute(
        builder: (context) =>
            BookingScreen(spaceData: spaceData, bookedData: bookedData),
      );

  const BookingScreen({super.key, required this.spaceData, this.bookedData});

  final SpaceData spaceData;
  final BookedData? bookedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: Colors.transparent,
        //   title: Text(
        //     spaceData.title,
        //     style: Theme.of(context).textTheme.titleMedium,
        //   ),
        //   iconTheme: Theme.of(context).iconTheme,
        //   centerTitle: true,
        // ),
        body: SpaceDetailsBody(
      spaceData: spaceData,
      bookedData: bookedData,
    ));
  }
}

class SpaceDetailsBody extends StatelessWidget {
  const SpaceDetailsBody({super.key, required this.spaceData, this.bookedData});

  final SpaceData spaceData;
  final BookedData? bookedData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(spaceData.picture),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topLeft,
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(8),
                  backgroundColor: Colors.white,
                ),
                child: const Icon(Icons.navigate_before, color: Colors.grey),
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceInfoBlock(children: [
                Text(spaceData.title,
                    style: TextStyle(
                        color: AppColors.textDark,
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.inter().fontFamily,
                        fontSize: 24)),
                const SizedBox(
                  height: 8,
                ),
                Text('${spaceData.price} / dia'),
              ]),
              const Divider(),
              SpaceInfoBlock(children: [
                Text(
                  "Comodiades inclusas",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "10 mesas\n50 cadeiras\nLimpeza do espaço\nBuffet",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ]),
              const Divider(),
              SpaceInfoBlock(children: [
                Text(
                  "Regras do espaço",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Para o bom convívio com o demais condôminos, é proibida música alta após as 22 nesses espaço. Além disso, não é permitido a presença de um número de convidados superior ao que o espaço comporta.",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ]),
              const Divider(),
              _getDateWidget()
            ],
          ),
        )
      ],
    );
  }

  Widget _getDateWidget() {
    if (bookedData == null) {
      return const BookingDatePickerBlock();
    } else {
      return DisplayDateTimeData(
        bookedData: bookedData!,
      );
    }
  }
}

class SpaceInfoBlock extends StatelessWidget {
  const SpaceInfoBlock({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}

class BookingDatePickerBlock extends StatefulWidget {
  const BookingDatePickerBlock({super.key});

  @override
  State<BookingDatePickerBlock> createState() => _BookingDatePickerBlockState();
}

class _BookingDatePickerBlockState extends State<BookingDatePickerBlock> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    timeController.text = "";
    super.initState();
  }

  // ------------------------------------------------------------------

  int _selectedTimeStamp = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  // ------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SpaceInfoBlock(children: [
      Text(
        "Selecione uma data para reservar",
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const SizedBox(
        height: 20,
      ),
      TextField(
        controller: dateController, //editing controller of this TextField
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          prefixIconConstraints: BoxConstraints(maxHeight: 20),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              right: 12,
            ),
            child: Icon(
              Icons.calendar_month,
              size: 20,
              color: Colors.grey,
            ),
          ),
          border: InputBorder.none,
          hintText: "Selecionar data",
        ),
        style: Theme.of(context).textTheme.bodyMedium,
        textAlignVertical: TextAlignVertical.center,
        readOnly: true, // when true user cannot edit text
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(), //get today's date
              firstDate: DateTime.now(),
              lastDate: DateTime(2101));

          if (pickedDate != null) {
            String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
            setState(() {
              dateController.text = formattedDate;
            });
          }
        },
      ),
      const SizedBox(
        height: 12,
      ),
      TextField(
        controller: timeController,
        readOnly: true,
        onTap: (() {
          _showDialog(
            CupertinoPicker(
              magnification: 1.22,
              squeeze: 1.2,
              useMagnifier: true,
              itemExtent: _kItemExtent,
              // This is called when selected item is changed.
              onSelectedItemChanged: (int selectedItem) {
                setState(() {
                  _selectedTimeStamp = selectedItem;
                  timeController.text = _timeStamps[_selectedTimeStamp];
                });
              },
              children: List<Widget>.generate(_timeStamps.length, (int index) {
                return Center(
                  child: Text(
                    _timeStamps[index],
                  ),
                );
              }),
            ),
          );
        }),
        decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.zero,
            // filled: true,
            // fillColor: Colors.red,
            prefixIconConstraints: BoxConstraints(maxHeight: 20),
            prefixIcon: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Icon(
                Icons.schedule,
                size: 20,
                color: Colors.grey,
              ),
            ),
            border: InputBorder.none,
            hintText: "Selecionar horário"),
        style: Theme.of(context).textTheme.bodyMedium,
        textAlignVertical: TextAlignVertical.center,
      ), 
      const SizedBox(height: 24,),
      const FullWidthButton(color: Colors.green, title: "Realizar reserva",)
    ]);
  }

  final double _kItemExtent = 32.0;
  final List<String> _timeStamps = <String>[
    '9h - 11h',
    '11h - 13h',
    '15h - 17h',
    '17h - 19h',
  ];
}

class DisplayDateTimeData extends StatelessWidget {
  const DisplayDateTimeData({super.key, required this.bookedData});

  final BookedData bookedData;

  @override
  Widget build(BuildContext context) {
    return SpaceInfoBlock(children: [
      Text(
        "Data e horário selecionados",
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const SizedBox(
        height: 12,
      ),
      ListTile(
        title: Text(
            "${bookedData.date?.day}/${bookedData.date?.month}/${bookedData.date?.year}"),
        leading: const Icon(
          Icons.calendar_month,
          size: 20,
        ),
        visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        dense: true,
        contentPadding: const EdgeInsets.all(0),
        minLeadingWidth: 10,
        horizontalTitleGap: 6,
      ),
      const ListTile(
        title: Text("15:00"),
        leading: Icon(
          Icons.schedule,
          size: 20,
        ),
        visualDensity: VisualDensity(horizontal: 0, vertical: -4),
        dense: true,
        contentPadding: EdgeInsets.all(0),
        minLeadingWidth: 10,
        horizontalTitleGap: 6,
      ),
      const SizedBox(height: 16,),
      const FullWidthButton(color: Colors.red, title: "Cancelar reserva",)
    ]);
  }
}

class FullWidthButton extends StatelessWidget {
  const FullWidthButton({
    Key? key,
    this.color,
    required this.title
  }) : super(key: key);


  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style:ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
