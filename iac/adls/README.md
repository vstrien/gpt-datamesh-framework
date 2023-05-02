
- `enable_https_traffic_only`: This option ensures that only secure HTTPS connections are allowed to the storage account.
- `allow_blob_public_access`: This option disables public access to the blobs stored in the storage account.
- `min_tls_version`: This option sets the minimum TLS version to 1.2 for secure communications.
- `network_rules`: This block configures network rules for the storage account. The `default_action` is set to "Deny" to enforce firewall rules, `virtual_network_subnet_ids` is a variable for a list of allowed subnet IDs, and `bypass` is set to "None" to disable any bypass options. `ip_rules` is a variable for a list of allowed IP addresses or IP ranges.
