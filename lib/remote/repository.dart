import 'package:hionepedia/data/model/animal_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepository {
  final supabase = Supabase.instance.client;

  Future<void> login() async {
    // Add your login logic here
  }

  Future<void> register() async {
    // Add your register logic here
  }

  Future<void> logout() async {
    // Add your logout logic here
  }

  Future<List<AnimalModel>> fetchAnimalData() async {
    final response = await Supabase.instance.client.from('animals').select();
    final List<dynamic> data = response as List<dynamic>;

    // Convert the data to a list of AnimalModel
    final List<AnimalModel> animals = AnimalModel.fromJsonList(data);
    return animals;
  }
}
