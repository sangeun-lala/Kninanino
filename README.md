# 🧶 Kninanino

*Kninanino* is a SwiftUI-based iOS app for knitters to track their projects, share updates, and discover knitting-friendly spots nearby — built solo as a full-stack learning journey and portfolio piece.

![Kninanino UI Prototype](assets/ui-overview.png) <!-- Replace with actual image when ready -->

👉 [View Interactive Figma Prototype](https://www.figma.com/design/M3brzgGpnqhuwkHNjUoV99/Kninanino?node-id=0-1&t=5DEPAp0DmLzJJgQN-1)

---

## 🔗 Quick Links
- [Vision](#-vision)
- [Feature List](#-core-features)
- [Architecture Overview](#-architecture-overview)
- [User Personas & Stories](#-user-personas--stories)
- [Data Mapping](#-data-mapping--architecture)
- [Roadmap](#-roadmap)
- [Current Progress](#-current-status)
- [Contact](#-get-in-touch)

---

## 🧠 Vision

Kninanino isn’t just a journal — it’s a warm, playful space where knitters can:

- Track their progress and reflect on their journey
- Share project photos and yarn insights
- Discover knitting-friendly spots and community hubs
- Find inspiration tailored to their taste and experience level

This app is also my hands-on entry point into full-stack development, with a focus on both mobile product design and long-term scalability.

---

## 🔨 What I'm Building

- iOS development using **Swift & SwiftUI**
- Backend design using **Firebase Firestore (NoSQL)**, designed for long-term compatibility with SQL
- Integration of **cloud sync, authentication, and photo storage**
- A deeper understanding of **system design, clean code, and developer–user empathy**

---

## 🧵 Core Features

| Feature | Status | Description |
|---------|--------|-------------|
| 📝 **Project Journal** | ✅ In Progress | Track yarns, progress, and notes with photo support |
| 📍 **Knitting Spots** | 🔜 Planned | Tag, review, and share cozy places to knit |
| 💬 **Community Inspiration Feed** | 🔜 Planned | Browse trending patterns and follow other knitters |
| 🧭 **Beginner's Guide** | 🔜 Planned | Curated resources for first-time knitters |

---

## 🗂️ Architecture Overview

| Layer         | Tool / Language      | Notes                                     |
|---------------|----------------------|-------------------------------------------|
| Frontend      | Swift, SwiftUI        | Building responsive UI and journaling forms |
| Backend       | Firebase Firestore    | Document-based, structured for scale      |
| Cloud Storage | Firebase Storage      | For storing user-uploaded photos          |
| Authentication| Firebase Auth         | For secure user login                     |
| Long-term     | PostgreSQL (planned)  | For analytics and multi-platform support  |

---

## 👤 User Personas & Stories

### Persona 1: 🧶 Beginner Knitter, Age 25, London
> "I just started my first scarf and want to track my progress in a fun and easy way. I'd love to find cafés near me where I can knit without awkward stares."

- Needs guidance, encouragement, and social discovery
- Wants light onboarding and journaling templates

### Persona 2: 🎯 Experienced Knitter, Age 45, Tokyo
> "I have a dozen WIPs. I want to track yarn usage, post progress photos, and share notes on the best needles or patterns."

- Needs robust tagging, yarn libraries, and offline access
- Wants pattern inspiration and trusted user reviews

---

## 🧱 Data Mapping & Architecture

I’m maintaining structured documentation of how each feature maps across:

- `SwiftUI` app data models
- Firestore document structure
- Planned SQL schema for future migration

📁 Check `data-models/` and `db-schema/` folders for the latest.

---

## 🛣️ Roadmap

| Feature | Status | Notes |
|---------|--------|-------|
| Project Journal | ✅ In Progress | Core MVP feature |
| Knitting Spot Map | 🟡 Next | Includes geolocation tagging |
| Inspiration Feed | 🔜 Planned | Community-driven discovery |
| Offline Support | 🔜 Planned | Local cache of journals |
| PostgreSQL Integration | 🔜 Future | For multi-platform growth |
| Pattern Analytics | 💡 Idea | Optional long-term feature using SQL & ML |

---

## 🚧 Current Status

Working on:
- ✅ Add New Journal Entry screen (MVP core feature)
- 🟡 Firestore structure & image uploads
- 🔜 Offline cache & project list view
- 🔜 Knitting Spot tagging UI

---

## 🤝 Get In Touch

If you're curious about the project, want to collaborate, or are building something similar — I’d love to chat!

📧 sechowork@gmail.com  
📍 London, UK

---

## ⚠️ Disclaimer

This is an early-stage learning and portfolio project. Code is a work in progress and **not yet production-ready**. API keys and sensitive credentials are safely excluded from this repository.

---

