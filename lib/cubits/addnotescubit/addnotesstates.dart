class Addnotesstates {
  const Addnotesstates();
}

class AddnotesInitial extends Addnotesstates {}

class AddnotesLoading extends Addnotesstates {}

class AddnotesSuccess extends Addnotesstates {}

class AddnotesFailure extends Addnotesstates {
  final String errorMessage;

  AddnotesFailure(this.errorMessage);
}
