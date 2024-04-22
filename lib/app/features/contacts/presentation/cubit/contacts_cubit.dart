import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/create_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/get_all_contact_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit({
    required CreateContactUseCase createContact,
    required GetAllContactsUseCase getAllContacts,
  }) : super(ContactsInitialState());
}
