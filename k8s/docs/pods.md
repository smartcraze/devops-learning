**Pod Creation Summary**

1. **Command Used**

   ```bash
   kubectl run nginx-image --image=nginx --port=80
   ```

2. **Pod Status**

   ```bash
   kubectl get pods
   ```

   **Output:**

   ```
   NAME          READY   STATUS    RESTARTS   AGE
   nginx-image   1/1     Running   0          11m
   ```

3. **Logs**
   Nginx started successfully with default configuration:

   ```bash
   kubectl logs nginx-image
   ```

   ```
   Configuration complete; ready for start up
   nginx/1.29.2 running on Linux (WSL2)
   ```

4. **Pod Details**

   ```bash
   kubectl describe pod nginx-image
   ```

   * **Pod IP:** `10.244.4.2` (internal)
   * **Node:** `local-worker`
   * **Container Port:** `80/TCP`
   * **Host Port:** not exposed (`0/TCP`)
   * **Status:** Running, Ready = True
   * **Events:** Image pulled, container created and started successfully

📌 **Note:** The pod is **internal only**, not accessible from the internet.
To expose it externally:

```bash
kubectl expose pod nginx-image --type=NodePort --port=80
```


## deleting the pods and nodes 