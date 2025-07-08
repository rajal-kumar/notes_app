# Notes API (Rails 8 + JSON API)

This is a simple Ruby on Rails API that allows users to create and retrieve notes. It's designed to work with a React frontend, and supports live Markdown previews via the frontend.

This project contains both the backend API (notes_api/) and the frontend React app (notes_frontend/) in a single monorepo-style setup. This was done for convenience during the build phase, allowing for fast iteration and tight integration between the two layers.

If I had more time, I would separate the backend and frontend into their own standalone repositories or folders, each with their own deployment and configuration structure — as you would in a production-grade project. That setup would allow:

Independent CI/CD pipelines

Better separation of concerns

More realistic deployment environments (e.g. Dockerized backend, static frontend hosting)

Easier scalability and collaboration

---

## 📦 Features

- Create notes with a title and Markdown-formatted body
- Retrieve all notes or a single note by ID
- JSON responses using ActiveModel::Serializers
- API versioning (`/api/v1`)
- CORS configured for local development (`localhost:5173`)
- RSpec request tests included

---

## 🚀 Getting Started

### 1. Install dependencies

```bash
bundle install
```

## Database set up

```bash
rails db:create db:migrate
```

## Running the API Server

```bash
bin/dev
```

Note: By default

- API runs on: `http://localhost:3000`
- Frontend runs on: `http://localhost:5173`


### Running tests

```bash
bundle exec rspec
```

### Frontend

To run the frontend (Vite + React):

```bash
cd notes_frontend
npm install
npm run dev
```

## Endpoints

| Method | URL                 | Description       |
| ------ | ------------------- | ----------------- |
| GET    | `/api/v1/notes`     | List all notes    |
| GET    | `/api/v1/notes/:id` | Get a single note |
| POST   | `/api/v1/notes`     | Create a new note |

```json
{
  "note": {
    "title": "Hello",
    "body": "This is **markdown**"
  }
}
```


