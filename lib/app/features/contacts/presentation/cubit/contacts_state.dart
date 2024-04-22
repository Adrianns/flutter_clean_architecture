part of 'contacts_cubit.dart';

abstract class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}

class ContactsInitialState extends ContactsState {}

class ContactsLoadingState extends ContactsState {}

class ContactsLoadedState extends ContactsState {
  final List<Contact> contacts;

  const ContactsLoadedState(this.contacts);

  @override
  List<Object> get props => [contacts];
}
