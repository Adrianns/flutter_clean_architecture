import 'package:clean_architecture_course/app/features/contacts/domain/usecases/create_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/get_all_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/presentation/cubit/contacts_cubit.dart';
import 'package:clean_architecture_course/app/features/contacts/presentation/pages/contact_list_page.dart';
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
