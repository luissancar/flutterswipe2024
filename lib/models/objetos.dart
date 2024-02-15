
class Objetos {
  final String nombre;
  final bool esFavorito;

  Objetos({required this.nombre, this.esFavorito = false});

  Objetos cambiarFavorito(bool favorito) {
    return Objetos(nombre: this.nombre, esFavorito: !favorito);
  }
}

final List<Objetos> objetos = [
  Objetos(nombre: 'Cosa01'),
  Objetos(nombre: 'Cosa02'),
  Objetos(nombre: 'Cosa03'),
  Objetos(nombre: 'Cosa04'),
  Objetos(nombre: 'Cosa05'),
  Objetos(nombre: 'Cosa06'),
];