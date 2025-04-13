# 🧵 User Data Model

This document outlines how user data is structured across the Swift app, Firestore, and a potential SQL backend.

---

## 🧩 Swift Struct (App Layer)

```swift
struct AppUser: Identifiable, Codable {
    let id: UUID
    let username: String
    let displayName: String
    let level: String              // "Beginner", "Expert", "Advanced"
    let profilePictureURL: String? // Optional mock image
    let bio: String
    let homebase: String           // The city where the user is based
}
```

---

## ☁️ Firestore Document Example (User: Sasa)

```json
{
  "username": "sasa_knits",
  "displayName": "Sasa",
  "level": "Beginner",
  "profilePictureURL": "https://example.com/images/sasa.jpg",
  "bio": "New to knitting, loving every stitch!",
  "homebase": "London"
}
```

---

## 🧱 SQL Table Schema (PostgreSQL)

```sql
CREATE TABLE users (
  id UUID PRIMARY KEY,
  username TEXT UNIQUE,
  display_name TEXT,
  level TEXT CHECK (level IN ('Beginner', 'Advanced', 'Expert')),
  profile_picture_url TEXT,
  bio TEXT,
  homebase TEXT
);
```

---

## 🔄 Mapping Table

| Field / Concept        | Swift Model                   | Firestore Document                      | SQL Table Column                          |
|------------------------|-------------------------------|------------------------------------------|-------------------------------------------|
| ID                     | `id: UUID`                    | Document ID (e.g., `"9b72f3e2-..."`)     | `id UUID PRIMARY KEY`                     |
| Username               | `username: String`            | `"username": "sasa_knits"`              | `username TEXT UNIQUE`                    |
| Display Name           | `displayName: String`         | `"displayName": "Sasa"`                 | `display_name TEXT`                       |
| Level                  | `level: String`               | `"level": "Beginner"`                   | `level TEXT CHECK (level IN ('Beginner', 'Advanced', 'Expert'))` |
| Profile Picture URL    | `profilePictureURL: String?`  | `"profilePictureURL": "https://..."`    | `profile_picture_url TEXT`                |
| Bio                    | `bio: String`                 | `"bio": "New to knitting..."`           | `bio TEXT`                                |
| Homebase               | `homebase: String`            | `"homebase": "London"`                  | `homebase TEXT`                           |
