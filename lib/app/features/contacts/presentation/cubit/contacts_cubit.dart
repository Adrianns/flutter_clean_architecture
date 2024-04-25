import 'package:clean_architecture_course/app/features/contacts/domain/entities/contact.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/create_contact_usecase.dart';
import 'package:clean_architecture_course/app/features/contacts/domain/usecases/get_all_contact_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contacts_state.dart';

/// The Cubit responsible for managing the state of the contacts feature.
class ContactsCubit extends Cubit<ContactsState> {
  final CreateContactUseCase createContactUseCase;
  final GetAllContactsUseCase getAllContactsUseCase;

  ContactsCubit({
    required this.createContactUseCase,
    required this.getAllContactsUseCase,
  }) : super(ContactsInitial());

  /// Retrieves all contacts and updates the state accordingly.
  void getAllContacts() async {
    emit(ContactsLoading());
    final result = await getAllContactsUseCase.execute();
    result.fold(
      (Exception error) => emit(ContactsError(error.toString())),
      (contacts) => emit(ContactsLoaded(contacts)),
    );
  }
}
