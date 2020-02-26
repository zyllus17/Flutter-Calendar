import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// Holiday list. It changes the color of holidays present in the list to red

final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 12): ['Birthday of Swami Vivekananda'],
  DateTime(2020, 1, 23): ['Birthday of Netaji'],
  DateTime(2020, 1, 26): ['Republic Day'],
  DateTime(2020, 1, 30): ['Saraswati Puja'],
  DateTime(2020, 1, 31): ['Saraswati Puja'],
  DateTime(2020, 2, 21): ['Shivratri'],
  DateTime(2020, 3, 9): ['Doljatra'],
  DateTime(2020, 3, 10): ['Holi'],
  DateTime(2020, 3, 23): ['Shab-e-Meraj'],
  DateTime(2020, 4, 5): ['University Foundation Day'],
  DateTime(2020, 4, 9): ['Shab-e-Barat'],
  DateTime(2020, 4, 10): ['Good Friday'],
  DateTime(2020, 4, 14): ['Bengali New Year\'s Day'],
  DateTime(2020, 5, 1): ['Mayday'],
  DateTime(2020, 5, 7): ['Buddha Purnima'],
  DateTime(2020, 5, 8): ['Birthday of Rabindra Nath Tagore'],
  DateTime(2020, 5, 21): ['Shab-e-Qadr'],
  DateTime(2020, 5, 22): ['Jummatul-Wada'],
  DateTime(2020, 5, 24): ['Eid-ul-Fitr'],
  DateTime(2020, 5, 25): ['Eid-ul-Fitr'],
  DateTime(2020, 5, 26): ['Eid-ul-Fitr'],
  DateTime(2020, 7, 31): ['Eid-ul-Azha'],
  DateTime(2020, 8, 1): ['Eid-ul-Azha'],
  DateTime(2020, 8, 2): ['Eid-ul-Azha'],
  DateTime(2020, 8, 3): ['Eid-ul-Azha'],
  DateTime(2020, 8, 11): ['Janmastami'],
  DateTime(2020, 8, 15): ['Independance Day'],
  DateTime(2020, 8, 30): ['Muharram'],
  DateTime(2020, 9, 17): ['Mahalaya'],
  DateTime(2020, 10, 2): ['Birthday of Gandhiji'],
  DateTime(2020, 10, 7): ['Calcutta Madrasah Foundation Day'],
  DateTime(2020, 10, 14): ['Akhri Chahar Shambah'],
  DateTime(2020, 10, 19): ['Puja Holiday\'s'],
  DateTime(2020, 10, 20): ['Puja Holiday\'s'],
  DateTime(2020, 10, 21): ['Puja Holiday\'s'],
  DateTime(2020, 10, 22): ['Puja Holiday\'s'],
  DateTime(2020, 10, 23): ['Puja Holiday\'s'],
  DateTime(2020, 10, 24): ['Puja Holiday\'s'],
  DateTime(2020, 10, 25): ['Puja Holiday\'s'],
  DateTime(2020, 10, 26): ['Puja Holiday\'s'],
  DateTime(2020, 10, 27): ['Puja Holiday\'s'],
  DateTime(2020, 10, 28): ['Puja Holiday\'s'],
  DateTime(2020, 10, 29): ['Puja Holiday\'s'],
  DateTime(2020, 10, 30): ['Puja Holiday\'s'],
  DateTime(2020, 11, 14): ['Kali Puja'],
  DateTime(2020, 11, 16): ['Bhatriditya'],
  DateTime(2020, 11, 17): ['Bhatriditya'],
  DateTime(2020, 11, 19): ['Chaat Puja'],
  DateTime(2020, 11, 20): ['Chaat Puja'],
  DateTime(2020, 11, 27): ['Fateha-Yez-Daham'],
  DateTime(2020, 11, 30): ['Birthday of Guru Nanak'],
  DateTime(2020, 12, 25): ['Christmas'],
};

//ThemeData

class Constants {
  static Color lightPrimary = Color(0xfff2f3f7);
  static Color lightAccent = Colors.blue;
  static Color lightBG = Color(0xfff2f3f7);

  static ThemeData lightTheme = ThemeData(
    backgroundColor: lightBG,
    primaryColor: lightPrimary,
    accentColor:  lightAccent,
    cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
  );
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calendar',
      debugShowCheckedModeBanner: false,
      theme: Constants.lightTheme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<DateTime, List> _events;
  List _selectedEvents;
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    final _selectedDay = DateTime.now();

//Copy the holiday list in events to show the reason of Holiday below the calendar

    _events = {
      DateTime(2020, 1, 1): ['New Year\'s Day'],
      DateTime(2020, 1, 12): ['Birthday of Swami Vivekananda'],
      DateTime(2020, 1, 23): ['Birthday of Netaji'],
      DateTime(2020, 1, 26): ['Republic Day'],
      DateTime(2020, 1, 30): ['Saraswati Puja'],
      DateTime(2020, 1, 31): ['Saraswati Puja'],
      DateTime(2020, 2, 21): ['Shivratri'],
      DateTime(2020, 3, 9): ['Doljatra'],
      DateTime(2020, 3, 10): ['Holi'],
      DateTime(2020, 3, 23): ['Shab-e-Meraj'],
      DateTime(2020, 4, 5): ['University Foundation Day'],
      DateTime(2020, 4, 9): ['Shab-e-Barat'],
      DateTime(2020, 4, 10): ['Good Friday'],
      DateTime(2020, 4, 14): ['Bengali New Year\'s Day'],
      DateTime(2020, 5, 1): ['Mayday'],
      DateTime(2020, 5, 7): ['Buddha Purnima'],
      DateTime(2020, 5, 8): ['Birthday of Rabindra Nath Tagore'],
      DateTime(2020, 5, 21): ['Shab-e-Qadr'],
      DateTime(2020, 5, 22): ['Jummatul-Wada'],
      DateTime(2020, 5, 24): ['Eid-ul-Fitr'],
      DateTime(2020, 5, 25): ['Eid-ul-Fitr'],
      DateTime(2020, 5, 26): ['Eid-ul-Fitr'],
      DateTime(2020, 7, 31): ['Eid-ul-Azha'],
      DateTime(2020, 8, 1): ['Eid-ul-Azha'],
      DateTime(2020, 8, 2): ['Eid-ul-Azha'],
      DateTime(2020, 8, 3): ['Eid-ul-Azha'],
      DateTime(2020, 8, 11): ['Janmastami'],
      DateTime(2020, 8, 15): ['Independance Day'],
      DateTime(2020, 8, 30): ['Muharram'],
      DateTime(2020, 9, 17): ['Mahalaya'],
      DateTime(2020, 10, 2): ['Birthday of Gandhiji'],
      DateTime(2020, 10, 7): ['Calcutta Madrasah Foundation Day'],
      DateTime(2020, 10, 14): ['Akhri Chahar Shambah'],
      DateTime(2020, 10, 19): ['Puja Holiday\'s'],
      DateTime(2020, 10, 20): ['Puja Holiday\'s'],
      DateTime(2020, 10, 21): ['Puja Holiday\'s'],
      DateTime(2020, 10, 22): ['Puja Holiday\'s'],
      DateTime(2020, 10, 23): ['Puja Holiday\'s'],
      DateTime(2020, 10, 24): ['Puja Holiday\'s'],
      DateTime(2020, 10, 25): ['Puja Holiday\'s'],
      DateTime(2020, 10, 26): ['Puja Holiday\'s'],
      DateTime(2020, 10, 27): ['Puja Holiday\'s'],
      DateTime(2020, 10, 28): ['Puja Holiday\'s'],
      DateTime(2020, 10, 29): ['Puja Holiday\'s'],
      DateTime(2020, 10, 30): ['Puja Holiday\'s'],
      DateTime(2020, 11, 14): ['Kali Puja'],
      DateTime(2020, 11, 16): ['Bhatriditya'],
      DateTime(2020, 11, 17): ['Bhatriditya'],
      DateTime(2020, 11, 19): ['Chaat Puja'],
      DateTime(2020, 11, 20): ['Chaat Puja'],
      DateTime(2020, 11, 27): ['Fateha-Yez-Daham'],
      DateTime(2020, 11, 30): ['Birthday of Guru Nanak'],
      DateTime(2020, 12, 25): ['Christmas'],
    };
    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedEvents = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter Calendar'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildTableCalendar(),
            const SizedBox(height: 8.0),
            Expanded(child: _buildEventList()),
          ],
        ),
      ),
    );
  }

  Widget _buildTableCalendar() {
    return TableCalendar(
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        todayColor: Theme.of(context).primaryColor,
        holidayStyle: TextStyle().copyWith(color: Colors.red),
        markersColor: Theme.of(context).primaryColor,
        todayStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.red),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonTextStyle:
            TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color: Colors.deepOrange[400],
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, events) => Container(
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.pinkAccent,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            date.day.toString(),
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        todayDayBuilder: (context, date, events) => Container(
          margin: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.purpleAccent,
              borderRadius: BorderRadius.circular(10.0)),
          child: Text(
            date.day.toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      onDaySelected: _onDaySelected,
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Center(child: Text(event.toString())),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }
}
