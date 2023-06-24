import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class EventDetailsFormPage extends StatefulWidget {
  final TextEditingController searchController;
  const EventDetailsFormPage({Key? key, required this.searchController}) : super(key: key);

  @override
  EventDetailsFormPageState createState() => EventDetailsFormPageState();
}

class EventDetailsFormPageState extends State<EventDetailsFormPage> {
  late DateTime selectedDate;
  late TimeOfDay startTime;
  late TimeOfDay endTime;

  bool dateButtonClicked = false;
  bool startTimeButtonClicked = false;
  bool endTimeButtonClicked = false;

  Color defaultButtonColor = Colors.grey;
  Color clickedOnButtonColor = const Color(0xFF76c893);

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    startTime = TimeOfDay.now();
    endTime = startTime.replacing(hour: startTime.hour + 1);
  }

  Future<void> _selectDate(BuildContext context) async {
    dateButtonClicked = true;
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    startTimeButtonClicked = true;
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: startTime,
    );

    if (pickedTime != null && pickedTime != startTime) {
      setState(() {
        startTime = pickedTime;
        if (endTime.hour < startTime.hour ||
            (endTime.hour == startTime.hour && endTime.minute < startTime.minute)) {
          endTime = pickedTime.replacing(
            hour: pickedTime.hour + 1,
            minute: pickedTime.minute,
          );
        }
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    endTimeButtonClicked = true;
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: endTime,
    );

    if (pickedTime != null && pickedTime != endTime) {
      setState(() {
        endTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const Text(
          'Event Details',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        GooglePlaceAutoCompleteTextField(
          textEditingController: widget.searchController,
          googleAPIKey: "AIzaSyAnnFBx4GtRd6HTKw22KmiOqziWYlxOEv0",
          inputDecoration: const InputDecoration(
            hintText: 'Location',
            hintStyle: TextStyle(color: Color(0xFF76c893)), // Change hint text color
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFF76c893), // Change search icon color
            ),
          ),
          debounceTime: 800,
          //countries: ["us"],
          isLatLngRequired: true,
          getPlaceDetailWithLatLng: (Prediction prediction) {
            double latitude = double.parse(prediction.lat!);
            double longitude = double.parse(prediction.lng!);
            LatLng location = LatLng(latitude, longitude);
            //onLocationSelected(location); // Call the callback function with the selected location
          },
          itmClick: (Prediction prediction) {
            widget.searchController.text = prediction.description!;

            widget.searchController.selection = TextSelection.fromPosition(
                TextPosition(offset: prediction.description!.length));
          },
          // default 600 ms ,
        ),
        ElevatedButton(
          onPressed: () => _selectDate(context),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(dateButtonClicked ? clickedOnButtonColor : defaultButtonColor),
          ),
          child: Text('Select Date: ${DateFormat('MM/dd/yyyy').format(selectedDate)}'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _selectStartTime(context),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(startTimeButtonClicked ? clickedOnButtonColor : defaultButtonColor),
          ),
          child: Text('Select Start Time: ${startTime.format(context)}'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _selectEndTime(context),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(endTimeButtonClicked ? clickedOnButtonColor : defaultButtonColor),
          ),
          child: Text('Select End Time: ${endTime.format(context)}'),
        ),
      ],
    );
  }
}
