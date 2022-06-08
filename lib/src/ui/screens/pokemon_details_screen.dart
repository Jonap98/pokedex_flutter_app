import 'package:flutter/material.dart';
import 'package:pokedex_app/src/bloc/pokemon_bloc.dart';
import 'package:pokedex_app/src/models/pokemon_model.dart';
import 'package:pokedex_app/src/ui/widgets/type_tag.dart';

class PokemonDetailsScreen extends StatelessWidget {
  final pokemonsBloc = PokemonsBloc();

  PokemonDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextStyle style1 = const TextStyle(color: Colors.grey);

    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder(
              stream: pokemonsBloc.getPoke,
              builder: (_, AsyncSnapshot<Result> snapshot) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: size.height * 0.3,
                        child: Image(
                          width: size.width * 0.5,
                          color: Colors.blue.withOpacity(0.3),
                          colorBlendMode: BlendMode.modulate,
                          image: const AssetImage('assets/pokeball_icon.png'),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        child: Container(
                          width: size.width,
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  snapshot.data!.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TypeTag(
                                    index: 0,
                                    text:
                                        snapshot.data!.type!.first.type!.name!),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        left: 0.0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: size.width * 0.2,
                            horizontal: 20,
                          ),
                          height: size.height * 0.5,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text('About'),
                                  Text('Base States'),
                                  Text('Evolutions'),
                                  Text('Moves'),
                                ],
                              ),
                              const Divider(),
                              Container(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Species', style: style1),
                                        const SizedBox(height: 10),
                                        Text('Height', style: style1),
                                        const SizedBox(height: 10),
                                        Text('Weight', style: style1),
                                        const SizedBox(height: 10),
                                        Text('Abilities', style: style1),
                                        const SizedBox(height: 10),
                                        Text('Gender', style: style1),
                                        const SizedBox(height: 10),
                                        Text('Egg Groups', style: style1),
                                        const SizedBox(height: 10),
                                        Text('Abilities', style: style1),
                                      ],
                                    ),
                                    const SizedBox(width: 40),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Speed'),
                                        const SizedBox(height: 10),
                                        const Text('2´3.6'),
                                        const SizedBox(height: 10),
                                        const Text('15.2 lbs'),
                                        const SizedBox(height: 10),
                                        const Text('Overgrow, Chlorophyl'),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.male,
                                              color: Colors.blue,
                                            ),
                                            Text('87.5%'),
                                            Icon(
                                              Icons.female,
                                              color: Colors.pink,
                                            ),
                                            Text('12.5%'),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        const Text('Monster'),
                                        const SizedBox(height: 10),
                                        const Text('Grass'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.3,
                        child: Image(
                          width: size.width * 0.2,
                          color: Colors.blue.withOpacity(0.3),
                          colorBlendMode: BlendMode.modulate,
                          image: const AssetImage('assets/pokeball_icon.png'),
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.2,
                        child: Container(
                          alignment: Alignment.center,
                          height: size.width * 0.8,
                          width: size.width,
                          // color: Colors.redAccent,
                          child: Image.network(
                            snapshot.data!.fullImage!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
