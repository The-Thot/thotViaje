class Sitios {
  var _id;
  var _lugar;
  var _ciudad;
  var _departamento;
  var _descripcion;
  var _foto;
  var _ubicacion;
  var _rating;
  var _motivo;

  Sitios(this._id, this._lugar, this._ciudad, this._departamento, this._descripcion,
      this._foto, this._ubicacion, this._rating, this._motivo);

  Map<String, dynamic> toJson() => {
    'id': _id,
    'lugar': _lugar,
    'ciudad': _ciudad,
    'departamento': _departamento,
    'descripcion': _descripcion,
    'foto': _foto,
    'ubicacion': _ubicacion,
    'rating': _rating,
    'motivo': _motivo
  };

  Sitios.fromJson(Map<String, dynamic> json)
      :   _id = json['id'],

        _lugar = json['lugar'],
        _ciudad = json['ciudad'],
        _departamento = json['departamento'],
        _descripcion = json['descripcion'],
        _foto = json['foto'],
        _ubicacion = json['ubicacion'],
        _rating = json['rating'],
        _motivo = json['motivo'];

  get rating => _rating;

  set rating(value) {
    _rating = value;
  }

  get ubicacion => _ubicacion;

  set ubicacion(value) {
    _ubicacion = value;
  }

  get foto => _foto;

  set foto(value) {
    _foto = value;
  }

  get descripcion => _descripcion;

  set descripcion(value) {
    _descripcion = value;
  }

  get departamento => _departamento;

  set departamento(value) {
    _departamento = value;
  }

  get ciudad => _ciudad;

  set ciudad(value) {
    _ciudad = value;
  }

  get lugar => _lugar;

  set lugar(value) {
    _lugar = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }

  get motivo => _motivo;

  set motivo(value) {
    _motivo = value;
  }
}
