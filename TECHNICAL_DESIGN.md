## Cloud File Storage Server - Technical Blueprint

**Author:** AnandRam Mohan

---

## 1. Introduction

### 1.1 What This Is

This project, boss, is all about taking back control. We don’t trust those big cloud companies with our files — so we’ve cooked up our own self-hosted solution. It’s clean, secure, and doesn’t sell your data to the highest bidder. You run it, you own it.

### 1.2 Why We Built It

The main intention? Keep your files in your own hands. We’re talking:

* A private vault — encrypted, fast, and fully local
* A web interface that won’t make you cry
* A base you can tweak, extend, or bolt onto other setups later

### 1.3 Who This Is For

We’re not building this for random folks uploading memes. This is for:

* DevOps teams who want to move files without public exposure
* Research groups dealing with confidential data
* Anyone who’s serious about privacy and doesn’t want to bow to Big Tech

### 1.4 Core Crew

| Role           | Job                                  |
| -------------- | ------------------------------------ |
| AnandRam Mohan | Architect, Dev, and Guardian of Code |
| End Users      | You folks managing files day-to-day  |

### 1.5 What You’ll Find Here

This doc is a blueprint. No fluff. It covers:

* Architecture — what’s where and why
* Core features — how it works under the hood
* Deployment — from zero to live
* Maintenance — keeping the machine humming

---

## 2. System Architecture

### 2.1 Layered Like a Good Paratha

This system follows the classic 3-tier model:

* **Frontend (UI):** What the user sees, built with good old HTML/CSS/JS
* **Backend (API):** Python Flask handling all the real business logic
* **Storage & DB:** PostgreSQL for metadata, local file system for your actual files

### 2.2 How the Flow Works

The user clicks or drags a file. That hits our Flask API. Backend processes it, stores the file locally, updates the DB. Done.

```
Browser → Flask API → [PostgreSQL + Local Filesystem]
```

### 2.3 Our Weaponry

| Layer    | Tech                        |
| -------- | --------------------------- |
| Frontend | HTML5, CSS3, Vanilla JS     |
| Backend  | Python Flask                |
| Database | PostgreSQL 14+              |
| Security | JWT Auth, bcrypt            |
| Storage  | Local Disk (RAID preferred) |

---

## 3. Functional Stuff

### 3.1 What Users Can Do

* Upload files (multiple at once)
* Download files with OG name intact
* Rename, delete, or sort files
* All behind login — session-based access

### 3.2 System Skills

**Main Abilities:**

* Drag-and-drop upload zone
* Full file metadata tracking
* Works smoothly even on mid-spec systems

**Security Add-ons:**

* RBAC-ready if you want to go multi-user
* End-to-end encryption (optional)
* JWT sessions with expiry

### 3.3 Performance Goals

* File listing loads under 2 seconds
* Concurrent uploads? Handles 5MB files easy
* Designed to scale if you throw more hardware

---

## 4. How It’s Built

### 4.1 Frontend Pieces

You’ve got:

* A login screen that doesn’t mess around
* Dashboard with filters, file previews
* Drag-and-drop area that just works

**Notes:**

* No frontend frameworks. Keeps it fast.
* Fetch API does the talking with backend

### 4.2 Backend Brain

Flask routes handle file actions. Here’s an example:

```python
def handle_upload(file):
    if not validate_file_type(file):
        raise Exception("Invalid file")
    filename = secure_filename(file)
    write_file(file, filename)
    log_metadata(filename)
```

### 4.3 Locking It Down

* JWT tokens expire after 8 hours
* Passwords hashed using bcrypt (12 rounds)
* All inputs are cleaned and sanitized

### 4.4 File Storage Scheme

Directory structure:

```
/storage/
  ├── user_1/
  │   ├── uploads/
  │   └── documents/
  └── user_2/
      └── projects/
```

Filenames:

```
[userID]_[timestamp]_[original_filename.ext]
```

---

## 5. Getting It Online

### 5.1 What You’ll Need

**Bare minimum:**

* 2 vCPUs
* 4 GB RAM
* 100 GB SSD

**Recommended:**

* RAID-1 config if you value uptime

### 5.2 Setup Steps

1. Create your DB:

```bash
psql -c "CREATE DATABASE filestore;"
```

2. Configure environment:

```ini
# .env
DB_URL=postgresql://user:pass@localhost:5432/filestore
JWT_SECRET=supersecurekey123
```

### 5.3 Ongoing Maintenance

* Daily auto-backups (files + DB)
* Disk usage monitoring with alerts
* Security audit every 3 months (or after breakups)

---

## 6. Quality Check

### 6.1 Test Everything

| Type        | Scope                | Tool      |
| ----------- | -------------------- | --------- |
| Unit        | 80%+ backend         | pytest    |
| Integration | End-to-end workflows | Postman   |
| Security    | OWASP Top 10         | OWASP ZAP |

### 6.2 Monitoring Tools

* API healthcheck endpoints (basic ping + heartbeat)
* Storage integrity checks (because corruption sucks)
* Usage metrics (disk, API calls, etc.)

---

## 7. Extras

### 7.1 Jargon Buster

* **JWT:** JSON Web Token — auth without storing sessions
* **RBAC:** Role-Based Access Control — define who can do what

### 7.2 Version History

| Version | Date           | Notes           |
| ------- | -------------- | --------------- |
| 1.0     | \[Insert Date] | Initial release |

### 7.3 Shoutouts

* Flask Security Guide (check it out)
* PostgreSQL Docs
* OWASP Cheat Sheet Series

---

## Final Note

This setup is made by someone who actually uses it — not just for show. It’s lean, private, and built with the same mindset as any good hacker: **don’t trust anything you didn’t build yourself**.

Stay safe. Encrypt everything. And control your stack like a boss.

* AnandRam Mohan
