import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class Menuscreen extends StatefulWidget {
  const Menuscreen({Key? key}) : super(key: key);

  @override
  State<Menuscreen> createState() => _MenuscreenState();
}

class _MenuscreenState extends State<Menuscreen> {
  int _selectedIndex = 0;
  int _selectedGraphics = 0;
    late WebViewController _controller;

  WebViewController _buildWebViewController(String url) {
    return WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Puedes usar esto para mostrar barra de carga si quieres
          },
          onPageStarted: (String url) {
            debugPrint('Page started: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  void initState() {
    super.initState();
    // Inicializa WebView cuando se crea el estado
    WebViewPlatform.instance;
  }

    void _onItemTappedGraphics(int index) {
    setState(() {
      _selectedGraphics = index;
    });
  }
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  Widget _RenderPage() {
    switch (_selectedIndex) {
      case 0:
        return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Curva decorativa similar a la pantalla de login
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Color(0xFF5DDDBC),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                ),
              ),
            ),
            
            // Bienvenida al usuario
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFF5DDDBC).withOpacity(0.2),
                    radius: 30,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Color(0xFF5DDDBC),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '¡Hola, Usuario!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '¿Qué haremos hoy?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Buscador
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    prefixIcon: Icon(Icons.search, color: Color(0xFF5DDDBC)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
            ),
            
            // Sección de categorías
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Categorías',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Categorías horizontales
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildCategoryItem(Icons.favorite, 'Favoritos'),
                  _buildCategoryItem(Icons.local_mall, 'Productos'),
                  _buildCategoryItem(Icons.event_note, 'Eventos'),
                  _buildCategoryItem(Icons.star, 'Destacados'),
                  _buildCategoryItem(Icons.groups, 'Comunidad'),
                ],
              ),
            ),
            
            // Sección destacada
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Destacados',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Ver todo',
                      style: TextStyle(
                        color: Color(0xFF5DDDBC),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Tarjetas destacadas
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _buildFeaturedItem('Elemento 1', '9.8', 'Descripción breve del elemento destacado 1'),
                  _buildFeaturedItem('Elemento 2', '9.5', 'Descripción breve del elemento destacado 2'),
                  _buildFeaturedItem('Elemento 3', '9.2', 'Descripción breve del elemento destacado 3'),
                ],
              ),
            ),
            
            // Sección de actividad reciente
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Actividad Reciente',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            // Lista de actividades
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return _buildActivityItem(
                  'Actividad ${index + 1}',
                  'Hace ${index + 1} hora${index > 0 ? 's' : ''}',
                  'Descripción breve de la actividad ${index + 1}',
                );
              },
            ),
            
            SizedBox(height: 20),
          ],
        ),
      ); // Aquí puedes agregar el contenido de la página de inicio
      case 1:
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white, // o cualquier fondo que prefieras
                      child: Center(
                        child: _RenderGraphics(),
                        // Puedes reemplazar esto con cualquier widget
                      ),
                    ),
                  ),
                  BottomNavigationBar(
                    backgroundColor: Colors.white,
                    selectedItemColor: Color(0xFF5DDDBC),
                    unselectedItemColor: Colors.grey,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: _selectedGraphics,
                    onTap: _onItemTappedGraphics,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.show_chart),
                        label: 'Tendencias',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.stacked_bar_chart),
                        label: 'Comparativas',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.bar_chart),
                        label: 'Estadísticas',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.donut_large),
                        label: 'Distribución',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ); // Aquí puedes agregar el contenido de la página de explorar
      case 2:
        return Container(); // Aquí puedes agregar el contenido de la página de añadir
      case 3:
        return Container(); // Aquí puedes agregar el contenido de la página de mensajes
      case 4:
        return Container(); // Aquí puedes agregar el contenido de la página de ajustes
      default:
        return Container();
    }
  }


  Widget _RenderGraphics() {
  switch (_selectedGraphics) {
    case 0:
      return WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://app.powerbi.com/view?r=eyJrIjoiY2IxZjRjZDYtYTY0My00MTQzLTg0ZjYtNmZjMGNkMGM2YjEzIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9')),
      );
    case 1:
      return WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://app.powerbi.com/view?r=eyJrIjoiYmJhYzFiYzMtYjA5Yi00ODExLTg5MzUtODRiY2NlZWU1ODQyIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9')),
      );
    case 2:
      return WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://app.powerbi.com/view?r=eyJrIjoiMzM4NjUyNGEtZDBjNi00ZmYwLTg3NDctZDc5NDRiNmFlOWM2IiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9')),
      );
    case 3:
      return WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse('https://app.powerbi.com/view?r=eyJrIjoiNDJhM2QyZDEtYjU3OC00Nzc2LWJmYmQtNmM2ZWZmNjk1ZDJlIiwidCI6IjRkZDEzM2ZkLWNhMmEtNDA5OC1hZTkxLTBlYWEwYzU4MjNiOCIsImMiOjR9')),
      );
    default:
      return Center(child: Text('Selecciona una gráfica'));
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF5DDDBC),
        elevation: 0,
        title: Text(
          'Bienvenido',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: _RenderPage(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Color(0xFF5DDDBC),
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.auto_graph_outlined),
                label: 'Gráficos',
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.add_circle_outline),
              //   label: 'Añadir',
              // ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.chat_bubble_outline),
              //   label: 'Mensajes',
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),
                label: 'Ajustes',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _selectedIndex == 0
    ? FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF5DDDBC),
        child: Icon(Icons.add),
      )
    : null,
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF5DDDBC).withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: Color(0xFF5DDDBC),
              size: 32,
            ),
          ),
          SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedItem(String title, String rating, String description) {
    return Container(
      width: 250,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF5DDDBC), Color(0xFF5DDDBC).withOpacity(0.7)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.image,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Color(0xFF5DDDBC).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xFF5DDDBC),
                            size: 16,
                          ),
                          SizedBox(width: 2),
                          Text(
                            rating,
                            style: TextStyle(
                              color: Color(0xFF5DDDBC),
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String time, String description) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFF5DDDBC).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Icon(
                Icons.notifications,
                color: Color(0xFF5DDDBC),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}