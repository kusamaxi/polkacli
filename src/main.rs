use clap::{App, ArgMatches};
use std::fs;
use toml::Value;

// Define the Command struct as before
// ...

fn handle_command(matches: &ArgMatches, user_config: &Value) {
    // Handle the different commands and subcommands
    if let Some(client_matches) = matches.subcommand_matches("client") {
        handle_client(client_matches, user_config);
    } else if let Some(config_matches) = matches.subcommand_matches("config") {
        handle_config(config_matches, user_config);
    }
    // Add more handlers for other commands
}

fn handle_client(matches: &ArgMatches, user_config: &Value) {
    if matches.subcommand_matches("version").is_some() {
        // Handle the 'version' subcommand
    } else if matches.subcommand_matches("download").is_some() {
        // Handle the 'download' subcommand
    }
    // Add more handlers for other client subcommands
}

fn handle_config(matches: &ArgMatches, user_config: &Value) {
    if let Some(get_matches) = matches.subcommand_matches("get") {
        let key = get_matches.value_of("KEY").unwrap();
        // Handle the 'get' subcommand
    } else if let Some(set_matches) = matches.subcommand_matches("set") {
        let key = set_matches.value_of("KEY").unwrap();
        let value = set_matches.value_of("VALUE").unwrap();
        // Handle the 'set' subcommand
    }
    // Add more handlers for other config subcommands
}

fn main() {
    let toml_str = fs::read_to_string("cli_structure.toml").unwrap();
    let config: Value = toml::from_str(&toml_str).unwrap();
    let user_config_str = fs::read_to_string("user_config.toml").unwrap();
    let user_config: Value = toml::from_str(&user_config_str).unwrap();

    let commands = build_commands_from_toml(&config);
    let app = App::new("polkacli").subcommands(commands);
    let matches = app.get_matches();

    handle_command(&matches, &user_config);
}
