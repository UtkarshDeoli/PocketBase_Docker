# 🚀 PocketBase Docker Setup

This guide helps you set up PocketBase using Docker for easy deployment and persistence of your data.

## 🛠️ **Build the Docker Image**

1. **Use Docker Buildx** to create your custom image:

    ```bash
    docker buildx build -t [username]/[name_image] .
    ```

    > Replace `[username]` with your Docker Hub username and `[name_image]` with the name you want for your image.

---

## 🏃 **Run the Built Container**

2. **Run the container** with persistence and auto-restart:

    ```bash
    docker run -d --restart unless-stopped --name [SomeName] -v $(pwd)/pb_data:/pb/pb_data -p [port]:8080 [username]/[name_image]
    ```

    > - Replace `[SomeName]` with the name you want for your container.
    > - Replace `[port]` with the desired port number.
    > - Replace `[username]/[name_image]` with your image name.

---

## 🔑 **Create Superuser (For First Login)**

3. **Access the container and create a superuser:**

    ```bash
    docker exec -it [name_of_container] sh
    cd pb/
    ./pocketbase superuser upsert [EMAIL] [PASS]
    ```

    > - Replace `[name_of_container]` with your container’s name.
    > - Replace `[EMAIL]` and `[PASS]` with the superuser credentials.

---

## 🌐 **Access PocketBase**

4. **Go to** `http://localhost:[port]` in your browser to log in.

---

## ⚙️ **Additional Tips**

- 🔄 **Update PocketBase**: Don't forget to change the version in the Dockerfile when a new update is available.
- 💾 **Persistent Data**: The `pb_data` directory stores your PocketBase backend data. Keep it safe!
- ⏲️ **Backup**: Set up periodic backups for `pb_data` to avoid data loss.

---

By following these simple steps, you can have a robust PocketBase setup running in no time! 😎

---