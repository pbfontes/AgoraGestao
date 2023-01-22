import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/models/models.dart';
import 'package:my_app/theme.dart';
import 'package:flutter/cupertino.dart';

class BookingScreen extends StatelessWidget {
  static Route route(spaceData) => MaterialPageRoute(
        builder: (context) => BookingScreen(
          spaceData: spaceData,
        ),
      );

  const BookingScreen({super.key, required this.spaceData});

  final SpaceData spaceData;

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
    ));
  }
}

class SpaceDetailsBody extends StatelessWidget {
  const SpaceDetailsBody({super.key, required this.spaceData});

  final SpaceData spaceData;

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
                  height: 8,
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
                  height: 8,
                ),
                Text(
                  "Para o bom convívio com o demais condôminos, é proibida música alta após as 22 nesses espaço. Além disso, não é permitido a presença de um número de convidados superior ao que o espaço comporta.",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ]),
              const Divider(),
              const BookingDatePickerBlock()
            ],
          ),
        )
      ],
    );
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

  @override
  void initState() {
    dateController.text = ""; //set the initial value of text field
    super.initState();
  }

  // ------------------------------------------------------------------

  int _selectedFruit = 0;

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
        height: 8,
      ),
      TextField(
        controller: dateController, //editing controller of this TextField
        decoration: const InputDecoration(
          icon: Icon(Icons.event),
          hintText: "Selecionar data",
          border: InputBorder.none,
        ),
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
      ElevatedButton(
          onPressed: (() => _showDialog(
                CupertinoPicker(
                  magnification: 1.22,
                  squeeze: 1.2,
                  useMagnifier: true,
                  itemExtent: _kItemExtent,
                  // This is called when selected item is changed.
                  onSelectedItemChanged: (int selectedItem) {
                    setState(() {
                      _selectedFruit = selectedItem;
                    });
                  },
                  children:
                      List<Widget>.generate(_fruitNames.length, (int index) {
                    return Center(
                      child: Text(
                        _fruitNames[index],
                      ),
                    );
                  }),
                ),
              )),
          child: Text(_fruitNames[_selectedFruit]))
    ]);
  }
}

const double _kItemExtent = 32.0;
const List<String> _fruitNames = <String>[
  'Apple',
  'Mango',
  'Banana',
  'Orange',
  'Pineapple',
  'Strawberry',
];
