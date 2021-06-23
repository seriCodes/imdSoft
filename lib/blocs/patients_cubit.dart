

 library patients_cubit;
 import 'package:bloc/bloc.dart';

import '../models/patient.dart';
import '../dummy_data.dart';

 part 'patients_state.dart';

  class PatientsCubit extends Cubit<PatientsState> {

  PatientsCubit() : super(PatientsState(DUMMY_PATIENTS));

  void get printSome {
    print("printSome PatientsCubit");
  }

  void saveHeartBeat (String value, String id){
List<Patient> newList= state.patients;
Patient result =newList.firstWhere((element) => element.id==id);
 result.hertBeat=int.parse(value);
 emit (PatientsState(newList));
}

// void decrement()=>emit(PatientsState(counterValue: state.counterValue-1, wasIncremented: false));

  }
