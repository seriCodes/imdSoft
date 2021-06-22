
 part of patients_cubit;

class PatientsState{
List<Patient> patients;

PatientsState({
  this.patients,
});
int get printSomeState {
    print("printSome patients");
    return 1;
  }
}