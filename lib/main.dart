import 'package:flutter/material.dart';

void main() {
  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cine papuhpro 👌🐭',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Color(0xFFFF1744), // Color rojo brillante
          ),
        ),
        cardTheme: CardTheme(
          color: Colors.black,
          elevation: 8.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFFF1744), // Color rojo brillante
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 4,
          iconTheme:
              IconThemeData(color: Color(0xFFFF1744)), // Color rojo brillante
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFFFF1744), // Color rojo brillante
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 14.0),
          ),
        ),
      ),
      home: MovieListScreen(),
    );
  }
}

class Movie {
  String title;
  String description;
  String imageUrl;
  double rating;

  Movie({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
  });
}

class MovieListScreen extends StatefulWidget {
  @override
  _MovieListScreenState createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  List<Movie> movies = [
    Movie(
      title: 'Inception',
      description:
          'Un ladrón que roba secretos corporativos mediante el uso de tecnología para compartir sueños.',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg',
      rating: 8.8,
    ),
    Movie(
      title: 'Interstellar',
      description:
          'Un equipo de exploradores viaja a través de un agujero de gusano en el espacio en un intento de asegurar la supervivencia de la humanidad.',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg',
      rating: 8.6,
    ),
    Movie(
      title: 'The Dark Knight',
      description:
          'Cuando el peligro conocido como el Joker surge de su misterioso pasado, siembra caos y destrucción en Gotham.',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
      rating: 9.0,
    ),
    Movie(
      title: 'Avatar',
      description:
          'Un Marine parapléjico enviado a la luna Pandora en una misión única.',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/6EiRUJpuoeQPghrs3YNktfnqOVh.jpg',
      rating: 7.8,
    ),
    Movie(
      title: 'The Matrix',
      description:
          'Un hacker informático aprende de rebeldes misteriosos sobre la verdadera naturaleza de su realidad y su papel en la guerra contra sus controladores.',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
      rating: 8.7,
    ),
    Movie(
      title: 'Pulp Fiction',
      description:
          'Una historia entrelazada de crimen y redención en Los Ángeles, centrada en varios personajes que se cruzan en el transcurso de una serie de eventos.',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/4lZehcC4A5t2fzC2gVgkhGNBKrL.jpg',
      rating: 8.9,
    ),
    Movie(
      title: 'The Shawshank Redemption',
      description:
          'La vida de un banquero que es condenado a cadena perpetua por un crimen que no cometió, mientras intenta sobrevivir en una prisión corrupta.',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/9O7gLzmreU0nGkIB6K3Bs3W6JfD.jpg',
      rating: 9.3,
    ),
    Movie(
      title: 'Fight Club',
      description:
          'Un hombre desencantado forma un club de lucha clandestino con un vendedor de jabón, desencadenando una serie de eventos impredecibles.',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/2nS8cfjTISqV2t1NDC32WBJS12H.jpg',
      rating: 8.8,
    ),
    Movie(
      title: 'Forrest Gump',
      description:
          'La vida extraordinaria de un hombre con un coeficiente intelectual bajo que se encuentra en el centro de los eventos más significativos de la historia estadounidense.',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/5f3YN9OxTiOaP9f5hdw3q4H7bdk.jpg',
      rating: 8.8,
    ),
    Movie(
      title: 'The Godfather',
      description:
          'La historia de la familia Corleone, una de las familias de la mafia más poderosas de Nueva York, y las complicaciones que surgen cuando el patriarca se enferma.',
      imageUrl:
          'https://image.tmdb.org/t/p/w500/3bhkrj58i5p8qYpdz06FjpxWklw.jpg',
      rating: 9.2,
    ),
  ];

  void _addMovie() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MovieFormScreen(
          onSave: (movie) {
            setState(() {
              movies.add(movie);
            });
          },
        ),
      ),
    );
  }

  void _editMovie(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MovieFormScreen(
          movie: movies[index],
          onSave: (updatedMovie) {
            setState(() {
              movies[index] = updatedMovie;
            });
          },
        ),
      ),
    );
  }

  void _removeMovie(int index) {
    setState(() {
      movies.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cartelera de Películas el papupro🐭🐭👌🤑😜👻👻👿👿👹👹'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return Card(
              margin: EdgeInsets.symmetric(
                  vertical: 10.0), // Añadir margen vertical
              child: ListTile(
                contentPadding:
                    EdgeInsets.all(16.0), // Aumentar el padding interior
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    movie.imageUrl,
                    width: 100, // Ancho fijo
                    height: 700, // Altura duplicada para un aspecto alargado
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 100, // Ancho fijo
                        height:
                            700, // Altura duplicada para un aspecto alargado
                        color: Colors.grey[900],
                        child: Icon(Icons.image, color: Colors.grey, size: 60),
                      );
                    },
                  ),
                ),
                title: Text(
                  movie.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center, // Centrar el título
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height:
                            8.0), // Espacio adicional entre el título y la descripción
                    Text(
                      movie.description,
                      maxLines: 3, // Permitir más líneas para la descripción
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                        height:
                            12.0), // Espacio adicional antes de la calificación
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow, size: 20),
                        SizedBox(width: 4),
                        Text(
                          movie.rating.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _editMovie(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeMovie(index),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMovie,
        child: Icon(Icons.add),
      ),
    );
  }
}

class MovieFormScreen extends StatefulWidget {
  final Movie? movie;
  final Function(Movie) onSave;

  MovieFormScreen({this.movie, required this.onSave});

  @override
  _MovieFormScreenState createState() => _MovieFormScreenState();
}

class _MovieFormScreenState extends State<MovieFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late String _imageUrl;
  late double _rating;

  @override
  void initState() {
    super.initState();
    _title = widget.movie?.title ?? '';
    _description = widget.movie?.description ?? '';
    _imageUrl = widget.movie?.imageUrl ?? '';
    _rating = widget.movie?.rating ?? 0.0;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final movie = Movie(
        title: _title,
        description: _description,
        imageUrl: _imageUrl,
        rating: _rating,
      );
      widget.onSave(movie);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.movie == null ? 'Agregar Película' : 'Editar Película'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _title,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.black54,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un título';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _description,
                decoration: InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.black54,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa una descripción';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _imageUrl,
                decoration: InputDecoration(
                  labelText: 'URL de la Imagen',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.black54,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa una URL para la imagen';
                  }
                  return null;
                },
                onSaved: (value) {
                  _imageUrl = value!;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                initialValue: _rating.toString(),
                decoration: InputDecoration(
                  labelText: 'Rating',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: Colors.black54,
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa una calificación';
                  }
                  final rating = double.tryParse(value);
                  if (rating == null || rating < 0 || rating > 10) {
                    return 'Por favor, ingresa una calificación válida (0-10)';
                  }
                  return null;
                },
                onSaved: (value) {
                  _rating = double.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(widget.movie == null ? 'Agregar' : 'Guardar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF1744), // Color rojo brillante
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
