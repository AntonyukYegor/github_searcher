import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_searcher/blocs/error_bloc/error_event.dart';
import 'package:github_searcher/blocs/error_bloc/error_state.dart';
import 'package:github_searcher/components/dialogs/error_dialog.dart';

class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  final BuildContext _context;

  ErrorBloc({required BuildContext context})
      : _context = context,
        super(const ErrorState()) {
    on<ShowDialogEvent>(_onShowDialog);
  }

  void _onShowDialog(ShowDialogEvent event, Emitter<ErrorState> emit) {
    showErrorDialog(
      error: '${event.title} ${event.message}',
      context: _context,
    );
  }
}
