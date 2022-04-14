import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white
                  ),
                  padding: const EdgeInsets.only(top: 20.0, left: 24.0, right: 24.0, bottom: 20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Text(
                            "Personajes",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w300,
                              fontSize: 20.0
                            ),
                          ),
                          SizedBox(width: 5.0,),
                          Text(
                            "Rick y Morty",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F5F5),
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              CupertinoIcons.search,
                              size: 20.0,
                              color: Colors.black.withOpacity(0.5),
                            ),
                            const SizedBox(width: 10.0),
                            // TextField(
                            //   decoration: InputDecoration(
                            //     labelText: 'Buscar personajes',
                            //   ),
                            //   controller: _searchController,
                            // )
                            Text(
                              "Buscar personajes",
                              style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w300,
                              fontSize: 16.0
                            ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => print("entra a vista personaje"),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: 156,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: FittedBox(
                                          child: Image.network("https://i.pinimg.com/originals/c9/d8/7a/c9d87ab356ee75dabc4e853fe54a9a6b.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF2ECC71),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.heart_fill, 
                                            size: 18.0, 
                                            color: Colors.white
                                          )
                                        )
                                      )
                                    ),
                                  ],
                                ),
                               const SizedBox(height: 8.0),
                               const Text(
                                 "Rick Sanchez",
                                 style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                               ),
                               const SizedBox(height: 8.0),
                               Row(
                                 children: <Widget>[
                                   const Icon(
                                     CupertinoIcons.circle_fill,
                                     size: 10.0,
                                     color: Color(0xFF2ECC71),
                                   ),
                                   const SizedBox(width: 5.0),
                                   Text(
                                     "Vivo",
                                     style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0
                                    ),
                                   )
                                 ],
                               )
                             ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: () => print("entra a vista personaje"),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: 156,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: FittedBox(
                                          child: Image.network("https://i.pinimg.com/originals/c9/d8/7a/c9d87ab356ee75dabc4e853fe54a9a6b.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF747474),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.heart, 
                                            size: 18.0, 
                                            color: Color(0xFFE5E5E5)
                                          )
                                        )
                                      )
                                    ),
                                  ],
                                ),
                               const SizedBox(height: 8.0),
                               const Text(
                                 "Rick Sanchez",
                                 style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                               ),
                               const SizedBox(height: 8.0),
                               Row(
                                 children: <Widget>[
                                   const Icon(
                                     CupertinoIcons.circle_fill,
                                     size: 10.0,
                                     color: Color(0xFF2ECC71),
                                   ),
                                   const SizedBox(width: 5.0),
                                   Text(
                                     "Vivo",
                                     style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0
                                    ),
                                   )
                                 ],
                               )
                             ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => print("entra a vista personaje"),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: 156,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: FittedBox(
                                          child: Image.network("https://i.pinimg.com/originals/c9/d8/7a/c9d87ab356ee75dabc4e853fe54a9a6b.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF2ECC71),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.heart_fill, 
                                            size: 18.0, 
                                            color: Colors.white
                                          )
                                        )
                                      )
                                    ),
                                  ],
                                ),
                               const SizedBox(height: 8.0),
                               const Text(
                                 "Rick Sanchez",
                                 style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                               ),
                               const SizedBox(height: 8.0),
                               Row(
                                 children: const <Widget>[
                                   Icon(
                                     CupertinoIcons.circle_fill,
                                     size: 10.0,
                                     color: Color(0xFF2ECC71),
                                   ),
                                   SizedBox(width: 5.0),
                                   Text(
                                     "Vivo",
                                     style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0
                                    ),
                                   )
                                 ],
                               )
                             ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: () => print("entra a vista personaje"),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: 156,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: FittedBox(
                                          child: Image.network("https://i.pinimg.com/originals/c9/d8/7a/c9d87ab356ee75dabc4e853fe54a9a6b.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF2ECC71),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.heart_fill, 
                                            size: 18.0, 
                                            color: Colors.white
                                          )
                                        )
                                      )
                                    ),
                                  ],
                                ),
                               const SizedBox(height: 8.0),
                               const Text(
                                 "Rick Sanchez",
                                 style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                               ),
                               const SizedBox(height: 8.0),
                               Row(
                                 children: const <Widget>[
                                   Icon(
                                     CupertinoIcons.circle_fill,
                                     size: 10.0,
                                     color: Color(0xFF2ECC71),
                                   ),
                                   SizedBox(width: 5.0),
                                   Text(
                                     "Vivo",
                                     style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0
                                    ),
                                   )
                                 ],
                               )
                             ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => print("entra a vista personaje"),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: 156,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: FittedBox(
                                          child: Image.network("https://i.pinimg.com/originals/c9/d8/7a/c9d87ab356ee75dabc4e853fe54a9a6b.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF2ECC71),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.heart_fill, 
                                            size: 18.0, 
                                            color: Colors.white
                                          )
                                        )
                                      )
                                    ),
                                  ],
                                ),
                               const SizedBox(height: 8.0),
                               const Text(
                                 "Rick Sanchez",
                                 style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                               ),
                               const SizedBox(height: 8.0),
                               Row(
                                 children: const <Widget>[
                                   Icon(
                                     CupertinoIcons.circle_fill,
                                     size: 10.0,
                                     color: Color(0xFF2ECC71),
                                   ),
                                   SizedBox(width: 5.0),
                                   Text(
                                     "Vivo",
                                     style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0
                                    ),
                                   )
                                 ],
                               )
                             ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: () => print("entra a vista personaje"),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: 156,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: FittedBox(
                                          child: Image.network("https://i.pinimg.com/originals/c9/d8/7a/c9d87ab356ee75dabc4e853fe54a9a6b.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF2ECC71),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.heart_fill, 
                                            size: 18.0, 
                                            color: Colors.white
                                          )
                                        )
                                      )
                                    ),
                                  ],
                                ),
                               const SizedBox(height: 8.0),
                               const Text(
                                 "Rick Sanchez",
                                 style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                               ),
                               const SizedBox(height: 8.0),
                               Row(
                                 children: const <Widget>[
                                   Icon(
                                     CupertinoIcons.circle_fill,
                                     size: 10.0,
                                     color: Color(0xFF2ECC71),
                                   ),
                                   SizedBox(width: 5.0),
                                   Text(
                                     "Vivo",
                                     style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0
                                    ),
                                   )
                                 ],
                               )
                             ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => print("entra a vista personaje"),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: 156,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: FittedBox(
                                          child: Image.network("https://i.pinimg.com/originals/c9/d8/7a/c9d87ab356ee75dabc4e853fe54a9a6b.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF2ECC71),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.heart_fill, 
                                            size: 18.0, 
                                            color: Colors.white
                                          )
                                        )
                                      )
                                    ),
                                  ],
                                ),
                               const SizedBox(height: 8.0),
                               const Text(
                                 "Rick Sanchez",
                                 style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                               ),
                               const SizedBox(height: 8.0),
                               Row(
                                 children: const <Widget>[
                                   Icon(
                                     CupertinoIcons.circle_fill,
                                     size: 10.0,
                                     color: Color(0xFF2ECC71),
                                   ),
                                   SizedBox(width: 5.0),
                                   Text(
                                     "Vivo",
                                     style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0
                                    ),
                                   )
                                 ],
                               )
                             ],
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          GestureDetector(
                            onTap: () => print("entra a vista personaje"),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: 156,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(24.0),
                                        child: FittedBox(
                                          child: Image.network("https://i.pinimg.com/originals/c9/d8/7a/c9d87ab356ee75dabc4e853fe54a9a6b.jpg"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 8,
                                      right: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF2ECC71),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.heart_fill, 
                                            size: 18.0, 
                                            color: Colors.white
                                          )
                                        )
                                      )
                                    ),
                                  ],
                                ),
                               const SizedBox(height: 8.0),
                               const Text(
                                 "Rick Sanchez",
                                 style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0
                                ),
                               ),
                               const SizedBox(height: 8.0),
                               Row(
                                 children: const <Widget>[
                                   Icon(
                                     CupertinoIcons.circle_fill,
                                     size: 10.0,
                                     color: Color(0xFF2ECC71),
                                   ),
                                   SizedBox(width: 5.0),
                                   Text(
                                     "Vivo",
                                     style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0
                                    ),
                                   )
                                 ],
                               )
                             ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}