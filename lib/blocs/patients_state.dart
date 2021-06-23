
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
 return makeCopy(e);})).toList();
    return result;
  }
  Patient patient(String id){
    print("patient id");
     print(id);


       Patient result = _patients.firstWhere((element) => element.id==id);

        print(result);

return makeCopy(result);
  }

// void savePatient(){

// }

  Patient makeCopy(Patient e){
    return new Patient(id: e.id, firstName: e.firstName, lastName: e.lastName, hertBeat:e.hertBeat, imageUrl:e.imageUrl);
     }  
  
void changeHeartBeat(){

}
}