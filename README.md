# Task Management System

Watch the project demo here: https://github.com/user-attachments/assets/458c5efc-fdf0-4a71-9aa3-65df61e2f205

Group Mmebers:
- Aila Fernandez Soriano

A full-stack Task Management application built with a **Flutter** frontend and a **Node.js/Express** backend, using **MongoDB** for data persistence. This project demonstrates a modern client-server architecture with RESTful API integration.

## 🚀 Tech Stack

### Frontend (Mobile/Web)
*   **Framework**: Flutter (Dart)
*   **UI Design**: Material 3 Design System
*   **State Management**: StatefulWidget (Ephemerals)
*   **Networking**: `http` package for API consumption
*   **Features**: Responsive layout, Grid Views, Forms with validation, Date Pickers, Custom Theming.

### Backend (API)
*   **Runtime**: Node.js
*   **Framework**: Express.js
*   **Database**: MongoDB (connected via Mongoose ODM)
*   **Middleware**: CORS (Cross-Origin Resource Sharing), dotenv (Environment variables)

---

## ✨ Features

*   **Task Management**:
    *   Create, Read, Update, and Delete (CRUD) tasks.
    *   Set due dates, descriptions, and priority flags.
    *   Mark tasks as Pending or Completed.
*   **Category Management**:
    *   Organize tasks into categories (e.g., Academic, Personal, Work).
    *   Visual Grid layout for categories.
    *   Pre-seeded default categories.
*   **Modern UI**:
    *   Clean, card-based layout.
    *   Visual indicators (Chips, Icons, Color-coded status).
    *   Responsive design compatible with Web and Android.

---

## 🛠️ Project Structure

```
task_manager/
├── backend/                # Node.js Express Server
│   ├── controllers/        # Logic for handling API requests
│   ├── models/             # Mongoose Schemas (Task, Category)
│   ├── routes/             # API Route definitions
│   ├── server.js           # Entry point for the backend
│   └── seed.js             # Script to populate initial data
├── lib/                    # Flutter Frontend Code
│   ├── models/             # Dart Data Models
│   ├── screens/            # UI Screens (Home, TaskList, Forms)
│   ├── services/           # API Service (HTTP calls)
│   └── main.dart           # App Entry point and Theme config
├── pubspec.yaml            # Flutter dependencies
└── package.json            # Backend dependencies
```

---

## 📖 How This Project Was Created (Step-by-Step Guide)

This section documents the process of building this application from scratch.

### Phase 1: Backend Development (Node.js & MongoDB)

1.  **Initialization**:
    *   Created a `backend` folder.
    *   Initialized a Node project: `npm init -y`.
    *   Installed dependencies: `npm install express mongoose cors dotenv`.

2.  **Database Connection**:
    *   Set up a MongoDB database (local or Atlas).
    *   Created `server.js` to connect to MongoDB using Mongoose.

3.  **Data Modeling**:
    *   Defined **Schemas** in `models/`:
        *   `Category.js`: Simple name field.
        *   `Task.js`: Title, description, status (enum), dueDate, and a reference to Category.

4.  **API Routes & Controllers**:
    *   Implemented REST endpoints in `routes/api.js`:
        *   `GET /api/tasks`: Fetch all tasks (with category population).
        *   `POST /api/tasks`: Create a new task.
        *   `PUT /api/tasks/:id`: Update task details.
        *   `DELETE /api/tasks/:id`: Remove a task.
        *   Similar endpoints for Categories.

### Phase 2: Frontend Development (Flutter)

1.  **Project Setup**:
    *   Created the Flutter app: `flutter create task_manager`.
    *   Added dependencies in `pubspec.yaml`: `http`, `intl` (for date formatting).

2.  **Data Layer**:
    *   Created Dart classes (`Task`, `Category`) in `lib/models/` to mirror the backend schemas.
    *   Implemented `fromJson` and `toJson` methods for serialization.

3.  **Service Layer**:
    *   Built `ApiService` in `lib/services/` to handle HTTP requests.
    *   **Key Challenge**: Handling localhost on Android Emulator.
    *   **Solution**: Used `10.0.2.2` for Android and `localhost` for Web/iOS.

4.  **UI Implementation**:
    *   **Main Entry**: Configured `MaterialApp` with `useMaterial3: true` for modern styling.
    *   **Screens**:
        *   `HomeScreen`: Bottom navigation controller.
        *   `TaskListScreen`: Displays tasks in a card layout.
        *   `TaskFormScreen`: Form with validation for adding/editing tasks.
        *   `CategoryScreen`: Grid view for managing categories.

5.  **Integration & Refinement**:
    *   Connected UI actions (onPressed) to `ApiService` methods.
    *   Added error handling (Snackbars) and loading states.
    *   Polished the UI with padding, rounded corners, and icons.

---

## ⚙️ Setup & Run Instructions

### Prerequisites
*   Node.js & npm
*   Flutter SDK
*   MongoDB (Running locally or cloud URL)

### 1. Backend Setup
1.  Navigate to the backend directory:
    ```bash
    cd backend
    ```
2.  Install dependencies:
    ```bash
    npm install
    ```
3.  Create a `.env` file with your MongoDB URI:
    ```
    MONGO_URI=mongodb://localhost:27017/taskmanager
    PORT=5000
    ```
4.  (Optional) Seed initial data:
    ```bash
    node seed.js
    ```
5.  Start the server:
    ```bash
    node server.js
    ```
    *Server runs on port 5000.*

### 2. Frontend Setup
1.  Navigate to the project root:
    ```bash
    cd ..
    ```
2.  Install dependencies:
    ```bash
    flutter pub get
    ```
3.  Run the app:
    *   **For Web**:
        ```bash
        flutter run -d chrome --web-port 8080
        ```
    *   **For Android**:
        ```bash
        flutter run
        ```

---

## 📸 Demo Scenarios

1.  **Seed Categories**: Run `node backend/seed.js` to instantly populate categories like "Work", "Personal", and "Health".
2.  **Create a Task**: Open the app, tap the FAB (+), select "Work" category, set a date, and save.
3.  **Complete a Task**: Tap a task to edit, change status to "Completed", and see the visual update.
