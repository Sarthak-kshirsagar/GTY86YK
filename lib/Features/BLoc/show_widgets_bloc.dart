import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'show_widgets_event.dart';
part 'show_widgets_state.dart';
//bloc to handle the communication between the buttons screen and showwidget screen
class ShowWidgetsBloc extends Bloc<ShowWidgetsEvent, ShowWidgetsState> {
  ShowWidgetsBloc() : super(ShowWidgetsInitial()) {
    on<addSaveButtonEvent>(_showSaveButton);
    on<addTextButtonEvent>(_showTextButton);
    on<addFieUploadButtonEvent>(_showFileUploadButton);
    on<allFieldsVisibileEvent>(_showAllFields);
    on<nonFieldsVisible>(_noneFieldSelected);
    on<TextImageevent>(_showTextImage);
    on<TextButtonevent>(_showText);
    on<FileUplaodEvent>(_file);
    on<SaveButtonEvent>(_save);
  }

  FutureOr<void> _showSaveButton(addSaveButtonEvent event, Emitter<ShowWidgetsState> emit) {
  print("emitting the save button satte");
  emit(showSaveButtonState());
  }

  FutureOr<void> _showTextButton(addTextButtonEvent event, Emitter<ShowWidgetsState> emit) {
    print("emitting the text button satte");
    emit(showTextButtonState());
  }

  FutureOr<void> _showFileUploadButton(addFieUploadButtonEvent event, Emitter<ShowWidgetsState> emit) {
    print("emitting the file upload button satte");
    emit(showFileUploadState());
  }

  FutureOr<void> _showAllFields(allFieldsVisibileEvent event, Emitter<ShowWidgetsState> emit) {
  print("all the states are visible");
  emit(showAllFieldsState());
  }

  FutureOr<void> _noneFieldSelected(nonFieldsVisible event, Emitter<ShowWidgetsState> emit) {
  emit(showNoneState());
  }

  FutureOr<void> _showTextImage(TextImageevent event, Emitter<ShowWidgetsState> emit) {
    emit(showTextImageState());
  }

  FutureOr<void> _showText(event, Emitter<ShowWidgetsState> emit) {
      emit(onlyText());
  }

  FutureOr<void> _file(event, Emitter<ShowWidgetsState> emit) {
    emit(onlyfile());
  }

  FutureOr<void> _save(event, Emitter<ShowWidgetsState> emit) {
    emit(onlysave());
   }
}
