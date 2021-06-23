
 part of patients_cubit;

class PatientsState{
List<Patient> _patients;

PatientsState(
  this._patients,
);
 
    //copy to guard the original state from changes
  List<Patient> get patients {
    print("List<Patient> get patients");  
List<Patient>  result = (_patients.map( (e) { 
          return new Patient(id: e.id, firstName: e.firstName, lastName: e.lastName, hertBeat:e.hertBeat, imageUrl:e.imageUrl);
     } )).toList();
    return result;
  }

}