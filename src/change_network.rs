use std::fs;
use std::io::{self, Write};
use std::process::Command;
use toml::Value;

fn main() {
    let config_path = "path/to/user_config.toml";
    let new_network = "kusama";

    // Read config
    let config_str = fs::read_to_string(config_path).unwrap();
    let mut config: Value = config_str.parse().unwrap();

    // Confirm with the user
    println!("Changing the active network will cause the node to restart and may lead to downtime. Do you want to proceed? (yes/no)");

    let mut user_input = String::new();
    io::stdin().read_line(&mut user_input).unwrap();

    if user_input.trim().to_lowercase() == "yes" {
        // Update active network
        config["active_network"] = Value::String(new_network.to_string());
        config["base_path"] = Value::String(format!("/opt/{}", new_network));

        // Write updated config back to the file
        let mut file = fs::File::create(config_path).unwrap();
        file.write_all(config.to_string().as_bytes()).unwrap();

        // Restart Polkadot service
        let service_name = config["networks"][new_network]["systemd_service_name"].as_str().unwrap();
        let restart_cmd = Command::new("systemctl")
            .arg("restart")
            .arg(service_name)
            .output()
            .expect("Failed to restart Polkadot service");

        println!("Polkadot service restarted: {}", service_name);
    } else {
        println!("Network change canceled.");
    }
}

