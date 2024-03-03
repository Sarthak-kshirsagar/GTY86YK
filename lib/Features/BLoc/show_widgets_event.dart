part of 'show_widgets_bloc.dart';

@immutable
abstract class ShowWidgetsEvent {}


class addSaveButtonEvent extends ShowWidgetsEvent{}

class addTextButtonEvent extends ShowWidgetsEvent{}

class addFieUploadButtonEvent extends ShowWidgetsEvent{}


class allFieldsVisibileEvent extends ShowWidgetsEvent{}

class nonFieldsVisible extends ShowWidgetsEvent{}


class TextImageevent extends ShowWidgetsEvent{}

class TextButtonevent extends ShowWidgetsEvent{}

class FileUplaodEvent extends ShowWidgetsEvent{}

class SaveButtonEvent extends ShowWidgetsEvent{}

