import 'package:flutter/material.dart';
import 'package:ninja_trips/models/trip.dart';
import 'package:ninja_trips/screens/details.dart';

class TripList extends StatefulWidget {
  @override
  _TripListState createState() => _TripListState();
}

class _TripListState extends State<TripList> {
  List<Widget> _tripTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late final Tween<Offset> _offset;

  @override
  void initState() {
    super.initState();
    _offset = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
    WidgetsBinding.instance.addPostFrameCallback((_) => _addTrips());
  }

  void _addTrips() {
    // get data from db
    List<Trip> _trips = [
      Trip(title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];

    Future _ft = Future(() {});

    _trips.forEach((Trip trip) async {
      _ft = _ft.then(
        (value) => Future.delayed(Duration(milliseconds: 100)).whenComplete(
          () {
            _tripTiles.add(ListItem(trip: trip));
            _listKey.currentState!.insertItem(_tripTiles.length - 1);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: _tripTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          child: _tripTiles[index],
          position: animation.drive(_offset),
        );
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final Trip trip;

  const ListItem({
    Key? key,
    required this.trip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.nights} nights',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue[300])),
          Text(trip.title, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'location-img-${trip.img}',
          child: Image.asset(
            'images/${trip.img}',
            height: 50.0,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }
}
