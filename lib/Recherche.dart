import 'package:flutter/material.dart';
import 'api_service.dart';

class Recherche extends StatefulWidget {
  @override
  _RechercheState createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  final TextEditingController _searchController = TextEditingController();
  final ApiService _apiService = ApiService();

  List<dynamic> _searchResults = [];
  String _searchStatus = '';

  void _performSearch() async {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      try {
        final results = await _apiService.searchCities(query);
        setState(() {
          _searchResults = results;
          _searchStatus = 'La ville a été trouvée.';
        });
      } catch (e) {
        // Gérer les erreurs de recherche
        setState(() {
          _searchResults = [];
          _searchStatus = 'Aucun résultat trouvé.';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ajouter une ville',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Saisissez le nom d\'une ville',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: Icon(Icons.search),
              ),
              onFieldSubmitted: (_) => _performSearch(),
            ),
            SizedBox(height: 20),
            Text(
              _searchStatus,
              style: TextStyle(
                fontSize: 16,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final city = _searchResults[index];
                  return ListTile(
                    title: Text(city['name']),
                    subtitle: Text(city['country']),
                    onTap: () {
                      // Ajouter la logique pour ajouter la ville à la page "Accueil"
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
