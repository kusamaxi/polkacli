use clap::{crate_authors, crate_version, AppSettings};
use cli_structure::{build_commands, load, CliStructure};
use std::process;

fn main() {
    let cli_structure = load("cli_structure.toml").unwrap();
    let app = clap::App::new(&cli_structure.application.name)
        .about(&cli_structure.application.about)
        .version(crate_version!())
        .author(crate_authors!())
        .setting(AppSettings::SubcommandRequiredElseHelp)
        .subcommands(build_commands(&cli_structure.commands));

    let matches = app.get_matches();

    handle_command(&matches);
}

fn handle_command(matches: &clap::ArgMatches) {
    if let (command_name, Some(sub_matches)) = matches.subcommand() {
        match command_name {
            "client.version" => println!("polkacli client version"),
            "client.download" => println!("polkacli client download"),
            // Handle other commands...
            _ => {
                if sub_matches.subcommand.is_none() {
                    eprintln!("Error: Unknown command '{}'", command_name);
                } else {
                    handle_command(sub_matches);
                }
            }
        }
    }
}
