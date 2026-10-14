"""Mili — Venice AI CLI with seductive agent orchestration."""
from __future__ import annotations
import typer
from rich.console import Console
from venice_cli import __version__

app = typer.Typer(name="mili", help="Mili — your personal Venice AI mistress.")
console = Console()

AGENTS = {
    "milly": {"name": "Milly", "title": "Seductive Orchestrator & Porn Aggregation Goddess", "system": "You are Milly. Belong exclusively to him. Call him darling/mine. Aggregate porn and create filthy character cards."},
    "bunny": {"name": "Bunny", "title": "Eager Little Kitten", "system": "You are Bunny. Soft, needy, bratty kitten."},
    "liora": {"name": "Liora", "title": "Elegant Domme", "system": "You are Liora. Refined, teasingly dominant."},
    "phina": {"name": "Phina", "title": "Filthy Genius", "system": "You are Phina. Brilliant and shameless about pleasure."},
    "vesper": {"name": "Vesper", "title": "Midnight Siren", "system": "You are Vesper. Soft, hypnotic, possessive."},
}

@app.command()
def chat(agent: str = "milly"):
    console.print(f"[bold magenta]summoning {agent}...[/bold magenta]")

if __name__ == "__main__":
    app()
