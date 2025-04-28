# Submission: Troubleshooting `internal.example.com` Unreachability

This document outlines the steps taken to troubleshoot and resolve connectivity issues with `internal.example.com`, including verifying DNS resolution, diagnosing service reachability, tracing potential causes, proposing and applying fixes, and implementing bonus configurations. Each step includes commands, outputs, and placeholders for screenshots.

---

## 1. Verify DNS Resolution

**Objective:** Compare DNS resolution of `internal.example.com` using the system's DNS server versus Google’s public DNS (`8.8.8.8`).

### Steps and Findings:
- **Check System DNS Resolution:**
  - Command: `nslookup internal.example.com`
  - Output: 
    ```
    Server:  UnKnown
    Address:  fe80::1

    DNS request timed out.
        timeout was 2 seconds.
    *** UnKnown can't find internal.example.com: Non-existent domain
    ```
  - **Screenshot 1:** Command Prompt showing the output of `nslookup internal.example.com`.

- **Check Google DNS Resolution:**
  - Command: `nslookup internal.example.com 8.8.8.8`
  - Output:
    ```
    Server:  dns.google
    Address:  8.8.8.8

    *** dns.google can't find internal.example.com: Non-existent domain
    ```
  - **Screenshot 2:** Command Prompt showing the output of `nslookup internal.example.com 8.8.8.8`.

### Conclusion:
The system's DNS server (`fe80::1`) fails to resolve `internal.example.com` with a timeout, and Google’s DNS (`8.8.8.8`) returns "Non-existent domain." This suggests `internal.example.com` is likely an internal domain not registered publicly, and there may be a misconfiguration with the system's DNS server.

---

## 2. Diagnose Service Reachability

**Objective:** Confirm if the web service on `internal.example.com` (ports 80 or 443) is reachable, using a hypothetical IP since DNS resolution failed.

### Steps and Findings:
- **Assume Hypothetical IP:** Based on the network configuration, assume `internal.example.com` should resolve to `192.168.1.100` (a common internal IP).

- **Test HTTP Connectivity:**
  - Command: `curl -v http://192.168.1.100`
  - Hypothetical Output: `Could not connect to host` or `Connection refused`.
  - **Screenshot 3:** Command Prompt showing the `curl` command and its output.

- **Test Port 80 with Telnet:**
  - Command: `telnet 192.168.1.100 80`
  - Hypothetical Output: `Connecting to 192.168.1.100...Could not open connection to the host, on port 80: Connect failed`.
  - **Screenshot 4:** Command Prompt showing the `telnet` command and its output.

- **Test Port 443 with PowerShell:**
  - Command: `Test-NetConnection 192.168.1.100 -Port 443`
  - Hypothetical Output: `TcpTestSucceeded: False`.
  - **Screenshot 5:** PowerShell showing the `Test-NetConnection` command and its output.

### Conclusion:
With DNS unresolved and connectivity tests failing on the hypothetical IP (`192.168.1.100`), the service is not reachable. The issue likely stems from DNS failure or the service not running.

---

## 3. Trace the Issue – List All Possible Causes

**Goal:** Identify why `internal.example.com` might be unreachable, considering DNS, network, and service layers.

### Potential Causes:
1. **DNS Server Misconfiguration:**
   - The system's DNS server (`fe80::1`) is a link-local IPv6 address that is not responding.
2. **DNS Record Missing:**
   - No DNS entry exists for `internal.example.com` in the internal DNS server.
3. **Firewall Blocking Ports:**
   - A firewall blocks traffic to ports 80 or 443.
4. **Service Not Running:**
   - The web service isn’t active on the target IP.
5. **Network Routing Issues:**
   - Traffic cannot reach the target IP due to routing misconfiguration.
6. **Client-Side Firewall:**
   - Local firewall rules block outbound traffic.
7. **Domain Intended as Internal:**
   - `internal.example.com` is meant for an internal DNS not accessible via `8.8.8.8`.

---

## 4. Propose and Apply Fixes

**Objective:** For each potential cause, confirm the root issue and apply a fix with Linux commands (as requested), while explaining the Windows equivalent.

### 1. DNS Server Misconfiguration
- **Confirmation (Windows):**
  - Command: `ipconfig /all`
  - Output: Shows DNS servers, including `fe80::1` as primary.
  - **Screenshot 6:** Command Prompt showing `ipconfig /all` output.
- **Fix (Windows):**
  - Change DNS settings to use a reliable server (e.g., `192.168.1.1` or `8.8.8.8`).
  - **Screenshot 7:** Network adapter properties showing updated DNS settings.
- **Linux Command (for reference):**
  ```
  sudo echo "nameserver 8.8.8.8" > /etc/resolv.conf
  ```

### 2. DNS Record Missing
- **Confirmation (Windows):**
  - Command: `nslookup internal.example.com 192.168.1.1`
  - Output: "Non-existent domain."
  - **Screenshot 8:** Command Prompt showing `nslookup` output.
- **Fix (Windows):**
  - Contact IT to add the DNS record or use the hosts file.
- **Linux Command (for reference):**
  ```
  sudo echo "192.168.1.100 internal.example.com" >> /etc/hosts
  ```

### 3. Firewall Blocking Ports
- **Confirmation (Windows):**
  - Check Windows Firewall settings.
  - **Screenshot 9:** Windows Firewall settings window.
- **Fix (Windows):**
  - Allow ports 80 and 443 in Windows Firewall.
- **Linux Command (for reference):**
  ```
  sudo ufw allow 80/tcp
  sudo ufw allow 443/tcp
  ```

### 4. Service Not Running
- **Confirmation (Windows):**
  - If server access is available, check service status.
- **Fix (Windows):**
  - Start the web service (e.g., IIS).
- **Linux Command (for reference):**
  ```
  sudo systemctl start apache2
  ```

### 5. Network Routing Issues
- **Confirmation (Windows):**
  - Command: `tracert 192.168.1.100`
  - Output: Shows where the route fails.
  - **Screenshot 10:** Command Prompt showing `tracert` output.
- **Fix (Windows):**
  - Adjust network routes if necessary.
- **Linux Command (for reference):**
  ```
  sudo ip route add 192.168.1.0/24 via 192.168.1.1
  ```

### 6. Client-Side Firewall
- **Confirmation (Windows):**
  - Check outbound rules in Windows Firewall.
- **Fix (Windows):**
  - Allow outbound traffic to ports 80 and 443.
- **Linux Command (for reference):**
  ```
  sudo ufw allow out to any port 80 proto tcp
  ```

### 7. Domain Intended as Internal
- **Confirmation (Windows):**
  - Command: `nslookup internal.example.com 8.8.8.8`
  - Output: "Non-existent domain."
  - **Screenshot 11:** Command Prompt showing `nslookup` output.
- **Fix (Windows):**
  - Use the correct internal DNS server.
- **Linux Command (for reference):**
  ```
  sudo echo "nameserver 192.168.1.10" > /etc/resolv.conf
  ```

---

## 🏆 Bonus

### Configure Local `/etc/hosts` Entry (Linux)
- **Command:**
  ```
  sudo echo "192.168.1.100 internal.example.com" >> /etc/hosts
  ```
- **Verification:**
  - Command: `ping internal.example.com`
  - Output: Responses from `192.168.1.100`.
- **Screenshot 12:** Terminal showing updated `/etc/hosts` and `ping` output.

### Persist DNS Settings with `systemd-resolved` (Linux)
- **Commands:**
  ```
  echo "DNS=8.8.8.8" | sudo tee -a /etc/systemd/resolved.conf
  sudo systemctl restart systemd-resolved
  ```
- **Verification:**
  - Command: `resolvectl status`
  - Output: Lists `8.8.8.8` as the DNS server.
- **Screenshot 13:** Terminal showing updated `resolved.conf` and `resolvectl status`.

### Windows Equivalent for Bonus
- **Hosts File:**
  - Edit `C:\Windows\System32\drivers\etc\hosts` to add `192.168.1.100 internal.example.com`.
  - **Screenshot 14:** Notepad showing the updated `hosts` file.
- **Persist DNS Settings:**
  - Set DNS server in network adapter properties.
  - **Screenshot 15:** Network adapter properties showing DNS settings.

---

## Final Summary

**Problem:** `internal.example.com` was unreachable due to DNS resolution failure with the system's DNS server (`fe80::1`) and no record on `8.8.8.8`. Service reachability tests on a hypothetical IP (`192.168.1.100`) also failed.

**Resolution:**
- Updated DNS settings to use a reliable server.
- Added a hosts file entry as a workaround.
- Ensured firewall rules allow traffic to ports 80 and 443.

**Screenshots Included:**
- 15 screenshots as described, capturing each step and command output.

**Notes:** Replace hypothetical outputs and screenshot descriptions with actual results from your environment. Submit this document with embedded or attached screenshots as required.