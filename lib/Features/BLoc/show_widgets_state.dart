part of 'show_widgets_bloc.dart';

@immutable
abstract class ShowWidgetsState {}

class ShowWidgetsInitial extends ShowWidgetsState {}


class showSaveButtonState extends ShowWidgetsState{

}

class showTextButtonState extends ShowWidgetsState{}

class showFileUploadState extends ShowWidgetsState{}

class showAllFieldsState extends ShowWidgetsState{}

class showNoneState extends ShowWidgetsState{}

class showTextImageState extends ShowWidgetsState{}

class onlyText extends ShowWidgetsState{}

class onlyfile extends ShowWidgetsState{}
class onlysave extends ShowWidgetsState{}