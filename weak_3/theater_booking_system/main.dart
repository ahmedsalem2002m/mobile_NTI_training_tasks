import 'dart:io';
import 'theater_class.dart';


void main() {
  Theater theater = Theater();

  print('Welcome To Our Theater');

  while (true) {
    printMenu();
    stdout.write('input=> ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        theater.bookSeat();
        break;
      case '2':
        theater.displaySeats();
        break;
      case '3':
        theater.showBookings();
        break;
      case '4':
        print('\n"See You Back"');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void printMenu() {
  print('\npress 1 to book new seat');
  print('press 2 to show the theater seats');
  print('press 3 to show users data');
  print('press 4 to exit');
}