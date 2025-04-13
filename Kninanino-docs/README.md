# Kninanino

Kninanino is a knitting-focused mobile app designed to help users track their knitting projects, explore inspiring locations, and connect with a creative community. 
Built from scratch as a solo project, this app is also my learning journey into full-stack development — from mobile architecture to backend design and long-term scalability.

---

## 🧠 Vision

Kninanino isn’t just a journal — it’s a warm, playful space where knitters can:
- Track their progress and reflect on their journey
- Share project photos and yarn insights
- Discover knitting-friendly spots and community hubs
- Find inspiration tailored to their taste and experience level

---

## 🔨 What I'm Building

This app is my entry point into:
- iOS development using **Swift & SwiftUI**
- Backend design using **Firestore (NoSQL)** with long-term compatibility with **SQL**
- Understanding cloud sync, data architecture, and system design
- Writing clean, testable code and making thoughtful product decisions

---

## 🗂️ Architecture Overview

| Layer         | Tool / Language             | Notes                                                                 |
|---------------|-----------------------------|-----------------------------------------------------------------------|
| Frontend      | Swift, SwiftUI              | Building responsive UI and journaling forms                          |
| Backend       | Firebase Firestore          | Document-based structure, later exportable to SQL                    |
| Cloud Storage | Firebase Storage            | For storing user-uploaded photos                                     |
| Authentication| Firebase Auth               | For user login, account association                                  |
| Long-term     | PostgreSQL (planned)        | For complex querying, analytics, and multi-platform flexibility      |

---

## 🧵 Core Features

- 📝 **Project Journal**  
  Add progress updates, yarn details, tags, and project photos

- 📍 **Knitting Spots**  
  Tag and review locations great for knitting

- 💬 **Community Inspiration Feed** (future)  
  View others’ progress and discover trending patterns

- 🧭 **Beginner's Guide** (future)  
  A simple path for knitting newbies to get started with confidence

---

## 🧱 Data Mapping & Architecture

I’m maintaining clear documentation of how each feature maps across:
- Swift app data models
- Firestore document structure
- SQL schema (for future migration)

📁 See `data-models/` and `db-schema/` folders for details.

---

## 💭 Why I'm Building This

I love knitting, design, and beautiful data flow.  
I also wanted to go beyond tutorials and build something real — not just a toy project, but an app I’d use and share.

This project is also about becoming a developer who understands both product thinking and solid architecture.

---

## 🚧 Current Status

Working on:  
✅ Add New Journal Entry screen (MVP core feature)  
🟡 Firestore structure & image uploads  
🔜 Offline cache & project list view

---

## 🤝 Get In Touch

If you're curious about the project, want to collaborate, or are building something similar — reach out!
sechowork@gmail.com

