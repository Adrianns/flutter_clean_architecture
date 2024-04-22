import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/create_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/get_all_contact_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  final CreateContactUseCase createContactUseCase;
  final GetAllContactsUseCase getAllContactsUseCase;
  ContactsCubit({
    required this.createContactUseCase,
    required this.getAllContactsUseCase,
  }) : super(ContactsInitial());

  void getAllContacts() async {
    emit(ContactsLoading());
    final result = await getAllContactsUseCase.execute();
    result.fold(
      (error) => emit(ContactsError(error as String)),
      (contacts) => emit(ContactsLoaded(contacts)),
    );
  }
}
