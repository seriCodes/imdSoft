

 library patients_cubit;
 import 'package:bloc/bloc.dart';

import '../models/patient.dart';
import '../dummy_data.dart';

 part 'patients_state.dart';

  class PatientsCubit extends Cubit<PatientsState> {

  PatientsCubit() : super(PatientsState(patients:DUMMY_PATIENTS));
  }
