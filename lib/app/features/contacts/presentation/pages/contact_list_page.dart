import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/presentation/cubit/contacts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A page that displays a list of contacts.
class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Contact List',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<ContactsCubit, ContactsState>(
        builder: (context, state) {
          return switch (state) {
            ContactsLoading() || ContactsInitial() => const Center(
                child: CircularProgressIndicator(),
              ),
            ContactsError() => Center(
                child: Text('Error: ${state.message}'),
              ),
            ContactsLoaded() => _ContactsLoaded(state.contacts),
          };
        },
      ),
    );
  }
}

class _ContactsLoaded extends StatelessWidget {
  const _ContactsLoaded(this.contacts);

  final List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    if (contacts.isEmpty) {
      return const Center(
        child: Text('No Contacts'),
      );
    }
    return ListView.separated(
      itemCount: contacts.length,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(
              '${contact.name[0]}${contact.name[contact.name.indexOf(' ') + 1]}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: Text(contact.name),
          subtitle: Text(contact.email.value),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
