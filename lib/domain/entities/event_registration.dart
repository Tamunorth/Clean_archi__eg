import 'package:hnh/domain/entities/user.dart';
import 'package:hnh/domain/entities/event.dart';

/// Represents an association between a [User] and an [Event].
/// The [User] is registered in the [Event].
class EventRegistration {

  // Members
  User _user;
  Event _event;
  String _registrationTime;

  // Getters
  User get user => _user;
  Event get event => _event;
  String get registrationTime => _registrationTime;

  // Constructors

  EventRegistration(this._user, this._event) {
    _registrationTime = (DateTime.now().millisecondsSinceEpoch / 1000).toString();
  }

  EventRegistration.fromEventRegistration(EventRegistration eventRegistration) {
    _user = User.fromUser(eventRegistration.user);
    _event = Event.fromEvent(eventRegistration.event);
    _registrationTime = eventRegistration.registrationTime;
  }

  EventRegistration.fromJson(Map<String, dynamic> map) {
    _user = User.fromJson(map['user']);
    _event = Event.fromJson(map['event']);
    _registrationTime = map['registrationTime'];
  }

  // Serializer
  Map<String, dynamic> toJson() =>
    {
      'user': user.toJson(),
      'event': event.toJson(),
      'registrationTime': _registrationTime
    };
}