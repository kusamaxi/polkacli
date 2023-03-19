use serde_derive::Deserialize;

#[derive(Debug, Deserialize)]
pub struct CliStructure {
    pub application: Application,
    pub options: Vec<Option>,
    pub commands: Vec<Command>,
}

#[derive(Debug, Deserialize)]
pub struct Application {
    pub name: String,
    pub about: String,
    pub version: String,
    pub authors: Vec<String>,
}

#[derive(Debug, Deserialize)]
pub struct Option {
    pub name: String,
    pub short: String,
    pub about: String,
}

#[derive(Debug, Deserialize)]
pub struct Command {
    pub name: String,
    pub about: String,
    pub aliases: Vec<String>,
    #[serde(default)]
    pub options: Vec<Option>,
    #[serde(default)]
    pub subcommands: Vec<Command>,
}

use clap::{App, Arg, SubCommand};
use std::fs::File;
use std::io::Read;
use toml;

pub fn load_cli_structure(file: &str) -> CliStructure {
    let mut content = String::new();
    let mut file = File::open(file).expect("Could not open the cli_structure.toml file");
    file.read_to_string(&mut content).expect("Could not read the cli_structure.toml file");

    toml::from_str(&content).expect("Could not parse the cli_structure.toml file")
}

pub fn build_app(cli_structure: &CliStructure) -> App {
    let mut app = App::new(&cli_structure.application.name)
        .about(&cli_structure.application.about)
        .version(&cli_structure.application.version)
        .author(&cli_structure.application.authors.join(", "));

    for option in &cli_structure.options {
        app = app.arg(
            Arg::with_name(&option.name)
                .short(&option.short)
                .help(&option.about),
        );
    }

    for command in &cli_structure.commands {
        app = app.subcommand(build_command(command));
    }

    app
}

fn build_command(command: &Command) -> App {
    let mut cmd = SubCommand::with_name(&command.name)
        .about(&command.about)
        .aliases(&command.aliases);

    for option in &command.options {
        cmd = cmd.arg(
            Arg::with_name(&option.name)
                .short(&option.short)
                .help(&option.about)
                .takes_value(option.takes_value.unwrap_or(false)),
        );
    }

    for subcommand in &command.subcommands {
        cmd = cmd.subcommand(build_command(subcommand));
    }

    cmd
}


