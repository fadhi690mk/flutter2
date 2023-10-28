import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


void main() {
  runApp(UserListingApp());
}

class UserListingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set background color to blue
        title: Text('User Listing Application'), // Set the title
        actions: [
          IconButton(
            icon: Icon(Icons.search), // Add a search icon
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Assuming you have a list of users
        itemBuilder: (context, index) {
          return UserTile();
        },
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        // User's profile picture (replace with an actual image URL)
        backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
      ),
      title: Text('User Full Name'),
      subtitle: Text('User Username'),
      onTap: () {
        // Navigate to the user detail screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserDetailScreen()),
        );
      },
    );
  }
}


class UserDetailScreen extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("User Details"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 70, 
            backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
          ),
          SizedBox(height: 20),
          Text(
            'User Full Name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('User Username', style: TextStyle(fontSize: 18)),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('user@example.com'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('(123) 456-7890'),
          ),
          ListTile(
            leading: Icon(Icons.public),
            title: Text('www.example.com'),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: () {
              
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MapScreen(userLocation: LatLng(-37.3159, 81.1496),)),
              );
            },
            icon: Icon(Icons.location_on),
            label: Text('View on Map'),
          ),
        ],
      ),
    );
  }
}

final LatLng userLocation = LatLng(-37.3159, 81.1496);
class MapScreen extends StatelessWidget {
  final LatLng userLocation; // Replace with actual user's latitude and longitude

  MapScreen({required this.userLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User's Location on Map"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: userLocation, // Set the user's location (LatLng) here
          zoom: 15.0, // Adjust the initial zoom level as needed
        ),
        markers: <Marker>{
          Marker(
            markerId: MarkerId("user_location"),
            position: userLocation,
            infoWindow: InfoWindow(title: "User's Location"),
          ),
        },
      ),
    );
  }
}

