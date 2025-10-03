# 📱 Animath (Flutter APP)

**Animath** is a fun and educational mobile app built with Flutter to help children practice basic arithmetic operations (addition, subtraction, multiplication, division) through an interactive drag-and-drop game experience.

---

## 🎯 Features

* ✅ 10 randomly generated math questions per session
* ✅ Child-friendly, minimalist and clean UI
* ✅ Drag-and-drop answer system
* ✅ Real-time feedback: green for correct, red for incorrect
* ✅ Live score tracking and end-of-game results screen
* ✅ All content and interface fully in English
* ✅ Works offline and without any sound or music

---

## 🎮 Gameplay

1. A math question appears (e.g., `6 × 2 = ?`)
2. Three draggable answer boxes are shown below.
3. The player drags the correct answer to the drop target.
4. Immediate feedback is shown (Correct / Wrong).
5. A "Next" button allows moving to the next question.
6. After 10 questions, a result screen displays the final score.

---

## 🧱 Tech Stack

* **Flutter** 3+
* `Draggable` and `DragTarget` widgets for interactions
* Responsive layout with `ConstrainedBox` and `Wrap`
* `setState` for simple state management

---

## 📁 Project Structure

```
lib/
 ┣ main.dart
 ┣ models/
 ┃ ┗ question.dart           # Dynamic question generator
 ┣ screens/
 ┃ ┣ home_screen.dart       # App intro and start screen
 ┃ ┣ game_screen.dart       # Core gameplay logic
 ┃ ┗ result_screen.dart     # Final score display and options
 ┣ widgets/
 ┃ ┗ draggable_answer.dart  # Reusable draggable answer box
```

---

## 🚀 Getting Started

```bash
git clone https://github.com/your-username/animath.git
cd animath
flutter pub get
flutter run
```

---

## 📸 Screenshots (Optional)

> Add screenshots/gifs of gameplay here for better engagement.

---

## 👨‍💻 Developer

**Bektaş Sarı**<br>
PhD in Advertising, AI + Creativity researcher<br>
Flutter Developer & Software Educator<br>

- **Email:** [bektas.sari@gmail.com](mailto:bektas.sari@gmail.com)  
- **GitHub:** [github.com/bektas-sari](https://github.com/bektas-sari)  
- **LinkedIn:** [linkedin.com/in/bektas-sari](https://www.linkedin.com/in/bektas-sari)  
- **Researchgate:** [researchgate.net/profile/Bektas-Sari-3](https://www.researchgate.net/profile/Bektas-Sari-3)  
- **Academia:** [independent.academia.edu/bektassari](https://independent.academia.edu/bektassari)

---

## 📜 License

MIT License – feel free to use, modify and share with credit.
