# 🌐 Private Cloud – File Storage Server

Welcome to my personal cloud. I built a **self-hosted file storage server** using Docker on **Kali Linux** — no third-party platforms, no data collection, no nonsense. Just my own private, secure environment where I control everything.

This setup lets me store, manage, and access files through a web-based interface from anywhere on my network — completely under my own control.

---

## 🔒 Why I Built This

I wanted something simple but powerful: a private cloud that respects **privacy**, avoids **ads**, and doesn’t sell my data. Cloud services are great, but handing over control never sat right with me. So I made my own.

---

## ✅ Key Advantages

- **Privacy & Security**  
  My data stays mine. No tracking, no surveillance — just a secure local file system.
  
- **Customizable**  
  Tweak it to your needs. You have full control over configurations and behavior.
  
- **No Data Collection**  
  Unlike Big Tech services, this setup collects **zero** personal info or usage data.

- **No Ads, No Bloat**  
  The interface is clean and distraction-free. Nothing but pure file access.

- **Open Source**  
  Built with open-source tools. If you want to extend it, fork it and go wild.

---

## 📂 Default Data Location

Your cloud files are stored in the Docker volume here: 
/var/lib/docker/volumes/fcdata/_data/

---

## 🚀 How to Start the Server

Run the following command in your terminal:

```bash
sudo docker run --name test-fc --privileged -d \
  -p 8080:80 -p 8443:443 \
  -v fcdata:/opt/fileclouddata \
  -v dbdata:/var/lib/mongodb \
  -v solrdata:/opt/solrfcdata/var/solr \
  -v htmldata:/var/www/html \
  filecloud/fileclouddocker:23.241 /lib/systemd/systemd
```

You can now access your file cloud at:
http://localhost:8080 or https://localhost:8443

### ⛔ How to Stop & Remove the Container
If you ever want to shut it down:

```bash
sudo docker stop test-fc
sudo docker rm test-fc
```
### 🔗 More Info
For full system architecture and design details, see [TECHNICAL_DESIGN.md](./TECHNICAL_DESIGN.md).
More details about this project are available on my blog:
👉 Visit Blog https://arenredd.github.io/

### 👨‍💻 About Me
I’m Anandram Mohan, a self-taught technologist passionate about privacy, open source, and building things that just work. This is one of many personal projects I’ve built to explore deeper into secure computing and decentralized systems.

### 📜 License
This project is for educational and personal use. Feel free to fork and adapt it!
