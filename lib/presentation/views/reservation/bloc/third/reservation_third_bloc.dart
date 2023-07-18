import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservation_app/domain/model/reservation/term/reservation_term_model.dart';
import 'package:reservation_app/presentation/utils/constants.dart';

part 'reservation_third_event.dart';

part 'reservation_third_state.dart';

class ReservationThirdBloc
    extends Bloc<ReservationThirdEvent, ReservationThirdState> {
  ReservationThirdBloc() : super(ReservationThirdInitial()) {
    on<ReservationThirdTermListEvent>(
      (event, emit) => _getAllTermsList(event, emit),
    );
    on<ReservationThirdTermClickEvent>(
      (event, emit) => _selectedTermList(event, emit),
    );
    on<ReservationThirdTermSelectAllEvent>(
      (event, emit) => _selectedTermAll(event, emit),
    );
  }

  void _getAllTermsList(
    ReservationThirdTermListEvent event,
    Emitter<ReservationThirdState> emit,
  ) {
    emit(ReservationThirdStateLoading());

    final termList = Constants.reservationTermList
        .map((item) => ReservationTermModel(title: item, isChecked: false))
        .toList();

    emit(ReservationThirdStateTermList(termsList: termList));
  }

  void _selectedTermList(
    ReservationThirdTermClickEvent event,
    Emitter<ReservationThirdState> emit,
  ) {
    final state = this.state;
    if (state is ReservationThirdStateTermList) {
      List<ReservationTermModel> termsList = state.termsList;

      final newTermsList = termsList.toList();

      final updateTermsList = termsList[event.selectedIndex].copyWith(
        isChecked: !termsList[event.selectedIndex].isChecked,
      );

      newTermsList[event.selectedIndex] = updateTermsList;

      emit(ReservationThirdStateTermList(termsList: newTermsList));
    }
  }

  void _selectedTermAll(
    ReservationThirdTermSelectAllEvent event,
    Emitter<ReservationThirdState> emit,
  ) {
    final state = this.state;
    if (state is ReservationThirdStateTermList) {
      List<ReservationTermModel> termsList = state.termsList;

      final newTermsList = termsList.map(
        (item) => ReservationTermModel(title: item.title, isChecked: event.isAllSelected),
      ).toList();

      emit(ReservationThirdStateTermList(termsList: newTermsList));
    }
  }
}
