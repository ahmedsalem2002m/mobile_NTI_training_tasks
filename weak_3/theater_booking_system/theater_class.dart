import 'user_class.dart';
import 'dart:io';

class Theater {
  int rows;
  int cols;
  late List<List<String>> seats;
  Map<String, User> bookings = {};

  Theater({this.rows = 5, this.cols = 5}) {
    seats = List.generate(rows, (_) => List.filled(cols, 'E'));
  }

  void bookSeat() {
    int? row = _getInput('Enter row (1-$rows): ', 1, rows);
    int? col = _getInput('Enter column (1-$cols): ', 1, cols);

    if (row == null || col == null) {
      print('Invalid seat position.');
      return;
    }


    if (_isSeatAvailable(row, col)) {
      print('This seat is already booked.');
      return;
    }


    User? user = _getUserInfo();
    if (user == null) {
      print('Invalid user input.');
      return;
    }


    _reserveSeat(row, col, user);
    print('Seat booked successfully!');

  }

  void displaySeats() {
    print('\nTheater Seats:');
    for (var row in seats) {
      print(row.join(' '));
    }
  }

  void showBookings() {
    print('\nUsers Booking Details:');
    if (bookings.isEmpty) {
      print('No bookings yet.');
      return;
    }

    bookings.forEach((seat, user) {
      print('Seat $seat: ${user.name} - ${user.phone}');
    });
  }


  int? _getInput(String prompt, int min, int max) {
    stdout.write(prompt);
    int? value = int.tryParse(stdin.readLineSync() ?? '');
    if (value == null || value < min || value > max) {
      return null;
    }
    return value;
  }

  bool _isSeatAvailable(int row, int col) {
    return seats[row - 1][col - 1] == 'B';
  }

  User? _getUserInfo() {
    stdout.write('Enter your name: ');
    String? name = stdin.readLineSync();

    stdout.write('Enter your phone number: ');
    String? phone = stdin.readLineSync();

    if (name == null || name.isEmpty || phone == null || phone.isEmpty) {
      return null;
    }

    return User(name, phone);
  }

  void _reserveSeat(int row, int col, User user) {
    seats[row - 1][col - 1] = 'B';
    bookings['$row,$col'] = user;
  }
}