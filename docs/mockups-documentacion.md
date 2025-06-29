# 📄 Documentación de Mockups - Juego TEG Digital

## 🎮 Introducción

Este documento describe los **mockups de pantallas** desarrollados para la versión digital del juego de mesa TEG. Los mockups fueron diseñados para representar de manera visual el flujo completo del usuario desde el inicio del juego hasta el desarrollo de una partida, respetando la estética estratégica y militar del juego original.

---

## 🧭 Mapa de Navegación (Flujo de Pantallas)

```plaintext
[Pantalla de Inicio]
    ├──> Nueva Partida
    │     └──> Añadir Bots
    │     └──> Iniciar Partida
    ├──> Cargar Partida
    ├──> Historial de Partidas
    └──> Cerrar Sesión

Durante la partida:
[Menú en Partida]
    ├──> Atacar
    ├──> Mover
    ├──> Reagrupar
    └──> Terminar Turno
```

---

## 🖼️ Pantallas del Juego

### 1. Pantalla de Inicio

- Botones visibles:
  - `Nueva Partida`
  - `Cargar Partida`
  - `Historial de Partidas`
  - `Cerrar Sesión`
- Propósito: punto de entrada general al juego.

---

### 2. Menú Principal de Nueva Partida

- Botones:
  - `Añadir Bots`: permite configurar bots en la partida.
  - `Iniciar Partida`: lanza una nueva partida.
  - `Salir al Menú Principal`: vuelve a la pantalla inicial.

---

### 3. Menú de Carga de Partida

- Función: permite al usuario seleccionar una partida guardada.
- Botones:
  - `Seleccionar Partida`
  - `Salir al Menú Principal`

---

### 4. Mapa Principal del Juego

- Representa el mapa dividido en regiones y países.
- Estilo estilizado con nombres de zonas visibles.
- Compatible con selección de territorios y visualización de ejércitos.

---

### 5. Menú en Partida

- Muestra:
  - Lista de jugadores activos
  - Objetivo secreto
  - Botones de acción:
    - `Atacar`
    - `Mover`
    - `Reagrupar`
    - `Terminar Turno`
  - Panel flotante para resultados de dados
- Esta pantalla es central para las acciones durante el turno.

---

## 📦 Relación con Implementación

Los mockups han sido representados en archivos HTML puros (`*.html`) y enlazados a un `styles.css` común para mantener consistencia visual.

Estos archivos se pueden encontrar en el repositorio `/frontend` bajo:

```
/frontend
├── pantalla-inicio.html
├── menu-principal.html
├── menu-carga-partida.html
├── menu-en-partida.html
├── mapa-principal.html
└── styles.css
```

---

## ✅ Conclusión

Esta documentación sirve como guía visual y funcional para el equipo de desarrollo. Permite asegurar que la implementación frontend respete el flujo, propósito y aspecto visual de la experiencia definida inicialmente.
