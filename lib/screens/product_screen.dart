import 'dart:ui';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../services/nutripet_score.dart';
import '../widgets/product/score_widget.dart';

class ProductScreen extends StatelessWidget {
final Product producto;

const ProductScreen({
super.key,
required this.producto,
});

@override
Widget build(BuildContext context) {
final resultado = ScoreCalculator.calculate(producto);

return Scaffold(  
  extendBodyBehindAppBar: true,  
  body: Stack(  
    children: [  

      Positioned.fill(  
        child: producto.imagen.isEmpty  
            ? Container(color: Colors.black)  
            : Image.network(  
                producto.imagen,  
                fit: BoxFit.cover,  
              ),  
      ),  

      Positioned.fill(  
        child: BackdropFilter(  
          filter: ImageFilter.blur(  
            sigmaX: 25,  
            sigmaY: 25,  
          ),  
          child: Container(  
            decoration: const BoxDecoration(  
              gradient: LinearGradient(  
                begin: Alignment.topCenter,  
                end: Alignment.bottomCenter,  
                colors: [  
                  Color(0x44000000),  
                  Color(0xAA000000),  
                  Color(0xFFF4F6F8),  
                  Color(0xFFF4F6F8),  
                ],  
              ),  
            ),  
          ),  
        ),  
      ),  

      SafeArea(  
        child: SingleChildScrollView(  
          physics: const BouncingScrollPhysics(),  
          child: Column(  
            children: [  

              Padding(  
                padding: const EdgeInsets.symmetric(  
                  horizontal: 18,  
                  vertical: 10,  
                ),  
                child: Row(  
                  children: [  

                    _circle(  
                      const Icon(Icons.arrow_back),  
                      () => Navigator.pop(context),  
                    ),  

                    const Spacer(),  

                    _circle(  
                      const Icon(Icons.favorite_border),  
                      () {},  
                    ),  

                  ],  
                ),  
              ),  

              const SizedBox(height: 10),  

              Stack(  
                alignment: Alignment.center,  
                clipBehavior: Clip.none,  
                children: [  

                  Hero(  
                    tag: producto.codigoBarras,  
                    child: Container(  
                      height: 330,  
                      margin: const EdgeInsets.symmetric(  
                        horizontal: 20,  
                      ),  
                      decoration: BoxDecoration(  
                        borderRadius: BorderRadius.circular(32),  
                        boxShadow: const [  
                          BoxShadow(  
                            color: Colors.black26,  
                            blurRadius: 35,  
                            offset: Offset(0, 15),  
                          ),  
                        ],  
                      ),  
                      child: ClipRRect(  
                        borderRadius: BorderRadius.circular(32),  
                        child: producto.imagen.isEmpty  
                            ? Container(  
                                color: Colors.white,  
                                child: const Center(  
                                  child: Icon(  
                                    Icons.pets,  
                                    size: 150,  
                                  ),  
                                ),  
                              )  
                            : Image.network(  
                                producto.imagen,  
                                fit: BoxFit.contain,  
                              ),  
                      ),  
                    ),  
                  ),  

                  Positioned(  
                    bottom: -55,  
                    child: Container(  
                      decoration: const BoxDecoration(  
                        shape: BoxShape.circle,  
                        boxShadow: [  
                          BoxShadow(  
                            color: Colors.black26,  
                            blurRadius: 25,  
                          ),  
                        ],  
                      ),  
                      child: ScoreWidget(  
                        score: resultado.score,  
                        size: 150,  
                      ),  
                    ),  
                  ),  

                ],  
              ),  

              const SizedBox(height: 85),  
              Container(  
                margin: const EdgeInsets.symmetric(horizontal: 18),  
                padding: const EdgeInsets.all(24),  
                decoration: BoxDecoration(  
                  color: Colors.white,  
                  borderRadius: BorderRadius.circular(28),  
                  boxShadow: const [  
                    BoxShadow(  
                      color: Colors.black12,  
                      blurRadius: 18,  
                    ),  
                  ],  
                ),  
                child: Column(  
                  children: [  

                    Text(  
                      producto.nombre,  
                      textAlign: TextAlign.center,  
                      style: const TextStyle(  
                        fontSize: 30,  
                        fontWeight: FontWeight.bold,  
                      ),  
                    ),  

                    const SizedBox(height: 10),  

                    Text(  
                      producto.marca,  
                      style: TextStyle(  
                        color: Colors.grey.shade600,  
                        fontSize: 18,  
                      ),  
                    ),  

                    const SizedBox(height: 22),  

                    Container(  
                      padding: const EdgeInsets.symmetric(  
                        horizontal: 18,  
                        vertical: 10,  
                      ),  
                      decoration: BoxDecoration(  
                        color: resultado.score >= 85  
                            ? Colors.green.shade100  
                            : resultado.score >= 70  
                                ? Colors.orange.shade100  
                                : Colors.red.shade100,  
                        borderRadius: BorderRadius.circular(40),  
                      ),  
                      child: Row(  
                        mainAxisSize: MainAxisSize.min,  
                        children: [  

                          Icon(  
                            resultado.score >= 85  
                                ? Icons.verified  
                                : resultado.score >= 70  
                                    ? Icons.thumb_up  
                                    : Icons.warning_amber_rounded,  
                            color: resultado.score >= 85  
                                ? Colors.green.shade700  
                                : resultado.score >= 70  
                                    ? Colors.orange.shade700  
                                    : Colors.red.shade700,  
                          ),  

                          const SizedBox(width: 8),  

                          Text(  
                            resultado.categoria,  
                            style: TextStyle(  
                              fontWeight: FontWeight.bold,  
                              fontSize: 16,  
                              color: resultado.score >= 85  
                                  ? Colors.green.shade700  
                                  : resultado.score >= 70  
                                      ? Colors.orange.shade700  
                                      : Colors.red.shade700,  
                            ),  
                          ),  

                        ],  
                      ),  
                    ),  

                    const SizedBox(height: 28),  

                    Align(  
                      alignment: Alignment.centerLeft,  
                      child: Text(  
                        "Ingredientes",  
                        style: TextStyle(  
                          fontSize: 22,  
                          fontWeight: FontWeight.bold,  
                          color: Colors.grey.shade900,  
                        ),  
                      ),  
                    ),  

                    const SizedBox(height: 14),  

                    Text(  
                      producto.ingredientes.isEmpty  
                          ? "No hay información disponible."  
                          : producto.ingredientes,  
                      style: const TextStyle(  
                        fontSize: 16,  
                        height: 1.6,  
                      ),  
                    ),  

                  ],  
                ),  
              ),  

              const SizedBox(height: 22),  

              _card(  
                Column(  
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  children: [  

                    const Row(  
                      children: [  
                        Icon(Icons.analytics_outlined),  
                        SizedBox(width: 10),  
                        Text(  
                          "Composición nutricional",  
                          style: TextStyle(  
                            fontSize: 22,  
                            fontWeight: FontWeight.bold,  
                          ),  
                        ),  
                      ],  
                    ),  

                    const SizedBox(height: 24),  

                    _nutritionBar(  
                      "Proteína",  
                      Icons.egg_alt,  
                      producto.proteina,  
                      Colors.red,  
                    ),  

                    const SizedBox(height: 18),  

                    _nutritionBar(  
                      "Grasa",  
                      Icons.water_drop,  
                      producto.grasa,  
                      Colors.orange,  
                    ),  

                    const SizedBox(height: 18),  

                    _nutritionBar(  
                      "Fibra",  
                      Icons.grass,  
                      producto.fibra,  
                      Colors.green,  
                    ),  

                    const SizedBox(height: 18),  

                    _nutritionBar(  
                      "Cenizas",  
                      Icons.science,  
                      producto.cenizas,  
                      Colors.blueGrey,  
                    ),  

                    const SizedBox(height: 18),  

                    _nutritionBar(  
                      "Humedad",  
                      Icons.opacity,  
                      producto.humedad,  
                      Colors.lightBlue,  
                    ),  

                  ],  
                ),  
              ),  

              const SizedBox(height: 24),  
              _card(  
                Column(  
                  crossAxisAlignment: CrossAxisAlignment.start,  
                  children: [  

                    const Row(  
                      children: [  
                        Icon(Icons.psychology_alt),  
                        SizedBox(width: 10),  
                        Text(  
                          "Análisis Nutripet",  
                          style: TextStyle(  
                            fontSize: 22,  
                            fontWeight: FontWeight.bold,  
                          ),  
                        ),  
                      ],  
                    ),  

                    const SizedBox(height: 20),  

                    _analysisBox(  
                      color: Colors.green.shade50,  
                      icon: Icons.thumb_up_alt_rounded,  
                      iconColor: Colors.green,  
                      text:  
                          "Buena fuente de proteína y composición equilibrada para la mayoría de perros adultos.",  
                    ),  

                    const SizedBox(height: 14),  

                    _analysisBox(  
                      color: Colors.orange.shade50,  
                      icon: Icons.warning_amber_rounded,  
                      iconColor: Colors.orange,  
                      text:  
                          "El análisis completo estará disponible cuando Nutripet IA evalúe ingredientes y aditivos.",  
                    ),  

                    const SizedBox(height: 14),  

                    _analysisBox(  
                      color: Colors.blue.shade50,  
                      icon: Icons.lightbulb,  
                      iconColor: Colors.blue,  
                      text:  
                          "En futuras versiones recibirás recomendaciones según edad, peso, actividad y patologías de tu mascota.",  
                    ),  

                  ],  
                ),  
              ),  

              const SizedBox(height: 28),  

              Padding(  
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),  
                child: SizedBox(  
                  width: double.infinity,  
                  height: 60,  
                  child: ElevatedButton.icon(  
                    onPressed: () {},  

                    style: ElevatedButton.styleFrom(  
                      backgroundColor: const Color(0xFF1E88E5),  
                      foregroundColor: Colors.white,  
                      elevation: 10,  
                      shadowColor: Colors.black26,  
                      shape: RoundedRectangleBorder(  
                        borderRadius: BorderRadius.circular(18),  
                      ),  
                    ),  

                    icon: const Icon(  
                      Icons.favorite_rounded,  
                      size: 24,  
                    ),  

                    label: Text(  
                      "Añadir a favoritos • ${resultado.categoria}",  
                      style: const TextStyle(  
                        fontSize: 17,  
                        fontWeight: FontWeight.bold,  
                      ),  
                    ),  
                  ),  
                ),  
              ),  

            ],  
          ),  
        ),  
      ),  
    ],  
  ),  
);

}
Widget _nutritionBar(
String titulo,
IconData icono,
double? valor,
Color color,
) {
final porcentaje = ((valor ?? 0) / 40).clamp(0.0, 1.0);

return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
Icon(
icono,
color: color,
size: 22,
),
const SizedBox(width: 10),
Expanded(
child: Text(
titulo,
style: const TextStyle(
fontSize: 16,
fontWeight: FontWeight.w600,
),
),
),
Text(
valor != null ? "${valor.toStringAsFixed(1)} %" : "--",
style: const TextStyle(
fontWeight: FontWeight.bold,
),
),
],
),
const SizedBox(height: 8),
ClipRRect(
borderRadius: BorderRadius.circular(20),
child: LinearProgressIndicator(
minHeight: 10,
value: porcentaje,
backgroundColor: Colors.grey.shade200,
valueColor: AlwaysStoppedAnimation<Color>(color),
),
),
],
);
}

Widget _analysisBox({
required Color color,
required IconData icon,
required Color iconColor,
required String text,
}) {
return Container(
padding: const EdgeInsets.all(18),
decoration: BoxDecoration(
color: color,
borderRadius: BorderRadius.circular(18),
),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Icon(
icon,
color: iconColor,
),
const SizedBox(width: 12),
Expanded(
child: Text(
text,
style: const TextStyle(
height: 1.5,
),
),
),
],
),
);
}

Widget _card(Widget child) {
return Container(
margin: const EdgeInsets.fromLTRB(18, 0, 18, 22),
padding: const EdgeInsets.all(22),
decoration: BoxDecoration(
color: Colors.white.withOpacity(0.96),
borderRadius: BorderRadius.circular(28),
boxShadow: const [
BoxShadow(
color: Colors.black12,
blurRadius: 20,
offset: Offset(0, 8),
),
],
),
child: child,
);
}

Widget _circle(
  Widget icon,
  VoidCallback onTap,
) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(100),
    child: BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 12,
        sigmaY: 12,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.65),
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.4),
          ),
        ),
        child: IconButton(
          icon: icon,
          splashRadius: 24,
          onPressed: onTap,
        ),
      ),
    ),
  );
}
}
