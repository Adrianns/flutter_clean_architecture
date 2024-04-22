import 'package:clean_architecture_course/app/features/contacts/domain/usecases/create_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/get_all_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/presentation/cubit/contacts_cubit.dart';
import 'package:clean_architecture_course/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<ContactsCubit>(
              create: (context) => ContactsCubit(
                    createContactUseCase: di.sl<CreateContactUseCase>(),
                    getAllContactsUseCase: di.sl<GetAllContactsUseCase>(),
                  )..getAllContacts()),
        ],
        child: const ContactListPage(),
      ),
    );
  }
}

class ContactListPage extends StatelessWidget {
  const ContactListPage({Key? key}) : super(key: key);

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
          if (state is ContactsLoading || state is ContactsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ContactsLoaded) {
            final contacts = state.contacts;
            if (contacts.isEmpty) {
              return const Center(
                child: Text('No Contacts'),
              );
            } else {
              return ListView.separated(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  final contact = contacts[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Text(
                        contact.name.substring(0, 2),
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
          } else if (state is ContactsError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
